-- ############################################################################
--
--   PLATAFORMA ELEMENTARES / PULSO URBANO
--   Modelo de Dados PostgreSQL - COMPLETO E CONSOLIDADO
--
--   Projeto: Tecsus | Cenario 5: Smart Cities e Saude Publica Urbana
--   FATEC Sao Jose dos Campos - 4o Semestre DSM - Sprint 1
--
-- ############################################################################
--
--   CONTEUDO DESTE ARQUIVO
--   ----------------------
--   PARTE 1 - Acesso e Identidade ......... papeis, usuarios        (US-01)
--   PARTE 2 - Dominio Operacional ......... estacoes                (US-03)
--                                           sensores, medidas       (US-05)
--                                           regras_alerta, alarmes  (US-06)
--   PARTE 3 - Banco Temporario ............ staging_telemetria      (US-04)
--   PARTE 4 - Rotinas de Manutencao ....... funcoes e views
--
--   COMO RODAR
--   ----------
--   psql -U postgres -d elementares -f modelo_completo_postgres.sql
--
--   O script e idempotente: pode ser executado mais de uma vez sem
--   duplicar dados nem gerar erro (usa IF NOT EXISTS e ON CONFLICT).
--
--   OBSERVACAO SOBRE A PARTE 3
--   --------------------------
--   Caso o squad opte por MongoDB como banco temporario, a PARTE 3 deve ser
--   removida deste arquivo e substituida pelo script 03_staging_mongo.js.
--   Nenhuma outra parte do modelo depende dela: a tabela de staging nao tem
--   chave estrangeira para as demais, por design.
--
-- ############################################################################

CREATE EXTENSION IF NOT EXISTS pgcrypto;


-- ############################################################################
-- PARTE 1 - ACESSO E IDENTIDADE
-- ############################################################################

-- ============================================================================
-- US-01 | Gestao de Contas e Perfis de Acesso  [microsservico: gestao-usuarios]
-- ============================================================================

CREATE TABLE IF NOT EXISTS papeis (
    id          UUID         PRIMARY KEY DEFAULT gen_random_uuid(),
    nome        VARCHAR(50)  NOT NULL UNIQUE,
    descricao   VARCHAR(200),
    criado_em   TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE papeis IS
    'Perfis canonicos de acesso: ADMINISTRADOR, GESTOR_PUBLICO e PESQUISADOR.';

-- Seed dos 3 papeis fixos (DoD da TASK-01.1).
-- ON CONFLICT torna o script idempotente: pode rodar varias vezes sem duplicar.
INSERT INTO papeis (nome, descricao) VALUES
    ('ADMINISTRADOR',  'Gestao irrestrita e global da plataforma.'),
    ('GESTOR_PUBLICO', 'Operacao e monitoramento restritos ao proprio municipio.'),
    ('PESQUISADOR',    'Acesso somente de consulta a series historicas.')
ON CONFLICT (nome) DO NOTHING;


CREATE TABLE IF NOT EXISTS usuarios (
    id          UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    nome        VARCHAR(120)  NOT NULL,
    email       VARCHAR(150)  NOT NULL UNIQUE,
    senha_hash  TEXT          NOT NULL,
    papel_id    UUID          NOT NULL REFERENCES papeis(id) ON DELETE RESTRICT,
    municipio   VARCHAR(100),
    esta_ativo  BOOLEAN       NOT NULL DEFAULT TRUE,
    criado_em   TIMESTAMPTZ   NOT NULL DEFAULT CURRENT_TIMESTAMP,
    atualizado_em TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON COLUMN usuarios.senha_hash IS
    'Hash bcryptjs (salt rounds 10). NUNCA armazenar a senha em texto claro.';
COMMENT ON COLUMN usuarios.esta_ativo IS
    'Inativacao logica (soft delete). FALSE bloqueia o login sem apagar o registro.';

-- Criterio de Aceite 4 da US-01: municipio e obrigatorio para Gestor Publico.
--
-- ATENCAO: nao da para usar CHECK aqui. O PostgreSQL proibe subqueries dentro
-- de CHECK constraints, e precisamos consultar a tabela papeis para saber se o
-- papel_id corresponde a GESTOR_PUBLICO. A solucao e um trigger.
CREATE OR REPLACE FUNCTION fn_valida_municipio_gestor()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.municipio IS NULL AND EXISTS (
        SELECT 1 FROM papeis
        WHERE id = NEW.papel_id AND nome = 'GESTOR_PUBLICO'
    ) THEN
        RAISE EXCEPTION 'Usuario com papel GESTOR_PUBLICO exige municipio definido.'
            USING ERRCODE = 'check_violation';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_valida_municipio_gestor ON usuarios;
CREATE TRIGGER trg_valida_municipio_gestor
    BEFORE INSERT OR UPDATE ON usuarios
    FOR EACH ROW EXECUTE FUNCTION fn_valida_municipio_gestor();

-- Indice para o filtro de listagem por municipio.
CREATE INDEX IF NOT EXISTS idx_usuarios_municipio ON usuarios (municipio);
-- Indice parcial: a maioria das consultas so busca usuarios ativos.
CREATE INDEX IF NOT EXISTS idx_usuarios_ativos ON usuarios (email) WHERE esta_ativo;


-- ============================================================================
-- US-03 | Cadastro de Estacoes Meteorologicas  [microsservico: gestao-estacoes]
-- ============================================================================

CREATE TABLE IF NOT EXISTS estacoes (
    id             UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    codigo         VARCHAR(30)   NOT NULL UNIQUE,
    nome           VARCHAR(120)  NOT NULL,
    municipio      VARCHAR(100)  NOT NULL,
    latitude       NUMERIC(9,6)  NOT NULL,
    longitude      NUMERIC(9,6)  NOT NULL,
    status         VARCHAR(20)   NOT NULL DEFAULT 'Ativa',
    nivel_bateria  INT,
    ultimo_ping    TIMESTAMPTZ,
    criado_em      TIMESTAMPTZ   NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Criterio de Aceite 5 da US-03: validacao de faixa das coordenadas.
    CONSTRAINT chk_latitude_valida  CHECK (latitude  BETWEEN -90  AND 90),
    CONSTRAINT chk_longitude_valida CHECK (longitude BETWEEN -180 AND 180),
    CONSTRAINT chk_status_estacao   CHECK (status IN ('Ativa', 'Inativa', 'Com Falha')),
    CONSTRAINT chk_bateria_valida   CHECK (nivel_bateria IS NULL
                                           OR nivel_bateria BETWEEN 0 AND 100)
);

COMMENT ON COLUMN estacoes.codigo IS
    'Codigo alfanumerico unico e imutavel apos a criacao (ex.: EST-SJC-001).';
COMMENT ON COLUMN estacoes.ultimo_ping IS
    'Ultima comunicacao recebida. NULL = estacao nunca transmitiu.';

CREATE INDEX IF NOT EXISTS idx_estacoes_municipio   ON estacoes (municipio);
CREATE INDEX IF NOT EXISTS idx_estacoes_ultimo_ping ON estacoes (ultimo_ping);


-- ============================================================================
-- US-05 | Parametrizacao e Calibracao dos Sensores
-- ============================================================================

CREATE TABLE IF NOT EXISTS sensores (
    id              UUID          PRIMARY KEY DEFAULT gen_random_uuid(),
    estacao_id      UUID          NOT NULL REFERENCES estacoes(id) ON DELETE RESTRICT,
    tipo            VARCHAR(50)   NOT NULL,
    unidade_medida  VARCHAR(20)   NOT NULL,
    fator           NUMERIC(12,6) NOT NULL DEFAULT 1.0,
    ganho           NUMERIC(12,6) NOT NULL DEFAULT 0.0,
    status          VARCHAR(20)   NOT NULL DEFAULT 'Ativo',
    criado_em       TIMESTAMPTZ   NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Criterio de Aceite 6 da US-05: uma grandeza por estacao.
    CONSTRAINT uq_sensor_por_estacao UNIQUE (estacao_id, tipo),
    CONSTRAINT chk_tipo_sensor   CHECK (tipo IN ('Temperatura', 'Umidade Relativa',
                                                 'PM2.5', 'PM10', 'Velocidade do Vento')),
    CONSTRAINT chk_status_sensor CHECK (status IN ('Ativo', 'Inativo'))
);

COMMENT ON COLUMN sensores.fator IS
    'Constante multiplicativa de conversao de escala. 1.0 = sensor ja calibrado.';
COMMENT ON COLUMN sensores.ganho IS
    'Deslocamento do ponto zero (offset). 0.0 = sem compensacao.';
COMMENT ON CONSTRAINT uq_sensor_por_estacao ON sensores IS
    'Impede dois sensores da mesma grandeza na mesma estacao (retorna 409 na API).';

CREATE INDEX IF NOT EXISTS idx_sensores_estacao ON sensores (estacao_id);


CREATE TABLE IF NOT EXISTS medidas (
    -- BIGSERIAL (nao UUID) porque esta tabela cresce muito e e sempre lida em
    -- ordem cronologica: um inteiro sequencial indexa melhor que um UUID aleatorio.
    id          BIGSERIAL     PRIMARY KEY,
    sensor_id   UUID          NOT NULL REFERENCES sensores(id) ON DELETE RESTRICT,
    unixtime    BIGINT        NOT NULL,
    valor       NUMERIC(12,4) NOT NULL,
    criado_em   TIMESTAMPTZ   NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE medidas IS
    'Serie temporal dos valores JA CALIBRADOS. Nao armazena leitura bruta.';
COMMENT ON COLUMN medidas.unixtime IS
    'Segundos desde 1970-01-01 UTC, enviados pela estacao. BIGINT (nao INTEGER) '
    'para evitar o overflow de 2038 dos inteiros de 32 bits com sinal.';

-- Indice composto: praticamente toda consulta de grafico filtra por sensor
-- e ordena por tempo decrescente. DESC deixa o "mais recente" no inicio.
CREATE INDEX IF NOT EXISTS idx_medidas_sensor_tempo
    ON medidas (sensor_id, unixtime DESC);


-- ============================================================================
-- US-06 | Regras e Limiares de Alerta Ambiental
-- ============================================================================

CREATE TABLE IF NOT EXISTS regras_alerta (
    id                 UUID           PRIMARY KEY DEFAULT gen_random_uuid(),
    sensor_id          UUID           NOT NULL REFERENCES sensores(id) ON DELETE RESTRICT,
    operador           VARCHAR(5)     NOT NULL,
    valor_limite       NUMERIC(10,2)  NOT NULL,
    nivel_severidade   VARCHAR(20)    NOT NULL,
    canal_notificacao  VARCHAR(30)    NOT NULL,
    esta_ativa         BOOLEAN        NOT NULL DEFAULT TRUE,
    criado_em          TIMESTAMPTZ    NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT chk_operador   CHECK (operador IN ('>', '<', '>=', '<=', '=')),
    CONSTRAINT chk_severidade CHECK (nivel_severidade IN ('Informativo', 'Alerta', 'Critico')),
    CONSTRAINT chk_canal      CHECK (canal_notificacao IN ('Painel', 'Email', 'SMS'))
);

COMMENT ON TABLE regras_alerta IS
    'A REGRA cadastrada pelo gestor. Fica inerte aguardando medicoes; nao gera dado sozinha.';

CREATE INDEX IF NOT EXISTS idx_regras_sensor    ON regras_alerta (sensor_id);
CREATE INDEX IF NOT EXISTS idx_regras_criado_em ON regras_alerta (criado_em);
-- Indice parcial: o servico-validacao so consulta regras ATIVAS a cada medicao.
-- Esse e o caminho mais quente do sistema, entao vale o indice dedicado.
CREATE INDEX IF NOT EXISTS idx_regras_ativas_por_sensor
    ON regras_alerta (sensor_id) WHERE esta_ativa;


CREATE TABLE IF NOT EXISTS alarmes (
    id               BIGSERIAL    PRIMARY KEY,
    regra_alerta_id  UUID         NOT NULL REFERENCES regras_alerta(id) ON DELETE RESTRICT,
    medida_id        BIGINT       NOT NULL REFERENCES medidas(id) ON DELETE RESTRICT,
    disparado_em     TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Criterio de Aceite: uma violacao gera EXATAMENTE um incidente.
    -- Protege contra duplicacao caso a mesma mensagem seja reprocessada
    -- (reentrega do RabbitMQ, retry do worker, etc).
    CONSTRAINT uq_alarme_por_medida_regra UNIQUE (regra_alerta_id, medida_id)
);

COMMENT ON TABLE alarmes IS
    'O INCIDENTE gerado. Criado pelo servico-validacao apenas quando uma medicao '
    'real viola uma regra ativa.';

CREATE INDEX IF NOT EXISTS idx_alarmes_disparado_em ON alarmes (disparado_em DESC);
CREATE INDEX IF NOT EXISTS idx_alarmes_regra        ON alarmes (regra_alerta_id);


-- ############################################################################
-- PARTE 3 - BANCO TEMPORARIO (STAGING)  [US-04 - ingestao-dados]
-- ############################################################################
-- 1. Tabela de amortecimento
-- ============================================================================

CREATE TABLE IF NOT EXISTS staging_telemetria (
    id             UUID         PRIMARY KEY DEFAULT gen_random_uuid(),

    -- Payload cru exatamente como chegou do broker MQTT.
    -- JSONB (e nao JSON) porque permite indexar e consultar campos internos.
    payload        JSONB        NOT NULL,

    -- Campos extraidos do payload na ingestao. Duplicam informacao que ja esta
    -- no JSONB, mas evitam ter que abrir o JSON so para rastrear uma mensagem.
    estacao_uuid   UUID,
    mac_address    VARCHAR(20),
    unixtime       BIGINT,

    processado     BOOLEAN      NOT NULL DEFAULT FALSE,
    criado_em      TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    processado_em  TIMESTAMPTZ,

    -- Controle de retentativa: se o servico-validacao falhar ao tratar esta
    -- mensagem, incrementa o contador e guarda o erro. Depois de N tentativas
    -- a mensagem vai para a DLQ do RabbitMQ e para de ser retentada.
    tentativas     SMALLINT     NOT NULL DEFAULT 0,
    ultimo_erro    TEXT,

    CONSTRAINT chk_processado_tem_data CHECK (
        (processado = FALSE AND processado_em IS NULL)
        OR (processado = TRUE AND processado_em IS NOT NULL)
    )
);

COMMENT ON TABLE staging_telemetria IS
    'Zona de amortecimento entre o MQTT e o tratamento assincrono. '
    'Alta rotatividade: exige rotina de limpeza periodica.';
COMMENT ON COLUMN staging_telemetria.payload IS
    'JSON bruto do dispositivo: uuid, macAddress, unixtime e leituras nao calibradas.';
COMMENT ON COLUMN staging_telemetria.tentativas IS
    'Numero de vezes que o processamento desta mensagem falhou.';


-- ============================================================================
-- 2. Indices
-- ============================================================================

-- O indice mais importante do arquivo. O servico-validacao pergunta
-- constantemente "quais mensagens ainda nao foram processadas?".
-- Sendo PARCIAL (WHERE NOT processado), o indice so guarda as linhas
-- pendentes - normalmente uma fracao minima da tabela. Ele nao cresce junto
-- com o historico de mensagens ja tratadas.
CREATE INDEX IF NOT EXISTS idx_staging_pendentes
    ON staging_telemetria (criado_em)
    WHERE NOT processado;

-- Usado pela rotina de limpeza para achar rapidamente o que ja pode sair.
CREATE INDEX IF NOT EXISTS idx_staging_processados_antigos
    ON staging_telemetria (processado_em)
    WHERE processado;

-- Rastrear todas as mensagens de uma estacao especifica (suporte / debug).
CREATE INDEX IF NOT EXISTS idx_staging_estacao
    ON staging_telemetria (estacao_uuid, criado_em DESC);


-- ============================================================================
-- 3. Rotina de limpeza (OBRIGATORIA em operacao de longo prazo)
-- ============================================================================
--
-- Remove mensagens JA PROCESSADAS mais antigas que o periodo de retencao.
-- Mensagens nao processadas NUNCA sao apagadas por esta funcao - se algo ficou
-- pendente, e porque falhou, e o dado precisa ser investigado.
--
-- Sugestao de retencao: 7 dias. Tempo suficiente para reprocessar um problema
-- detectado na segunda-feira que comecou na sexta.

CREATE OR REPLACE FUNCTION fn_limpar_staging(dias_retencao INT DEFAULT 7)
RETURNS INT AS $$
DECLARE
    removidos INT;
BEGIN
    DELETE FROM staging_telemetria
    WHERE processado = TRUE
      AND processado_em < CURRENT_TIMESTAMP - (dias_retencao || ' days')::INTERVAL;

    GET DIAGNOSTICS removidos = ROW_COUNT;
    RAISE NOTICE 'Limpeza do staging: % registros removidos.', removidos;
    RETURN removidos;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION fn_limpar_staging IS
    'Remove mensagens ja processadas fora do periodo de retencao. '
    'Agendar execucao diaria (cron do sistema ou job da aplicacao).';


-- Consulta de diagnostico: rode periodicamente para acompanhar a saude da fila.
-- Se "pendentes" so cresce, o servico-validacao nao esta dando conta do volume.
CREATE OR REPLACE VIEW vw_saude_staging AS
SELECT
    COUNT(*) FILTER (WHERE NOT processado)                      AS pendentes,
    COUNT(*) FILTER (WHERE processado)                          AS processados,
    COUNT(*) FILTER (WHERE NOT processado AND tentativas > 0)   AS com_falha,
    MIN(criado_em) FILTER (WHERE NOT processado)                AS pendente_mais_antigo,
    pg_size_pretty(pg_total_relation_size('staging_telemetria')) AS tamanho_em_disco
FROM staging_telemetria;


-- ============================================================================
-- 4. OPCIONAL: particionamento mensal
-- ============================================================================
--
-- Para operacao de VARIOS ANOS com volume alto, apagar linha por linha com
-- DELETE fica lento e deixa espaco morto no disco (bloat), exigindo VACUUM.
--
-- A alternativa e particionar por mes: cada mes vira uma tabela fisica separada,
-- e "limpar" um mes inteiro passa a ser um DROP TABLE - instantaneo, sem bloat.
--
-- QUANDO ADOTAR: so quando a rotina de limpeza da secao 3 comecar a demorar ou
-- a tabela passar de alguns milhoes de linhas. Nao vale a complexidade antes
-- disso. Se adotar, esta secao SUBSTITUI o CREATE TABLE da secao 1.
--
-- ATENCAO: em tabela particionada, a chave primaria precisa incluir a coluna de
-- particionamento - por isso o PRIMARY KEY vira (id, criado_em).
--
-- CREATE TABLE staging_telemetria (
--     id             UUID         NOT NULL DEFAULT gen_random_uuid(),
--     payload        JSONB        NOT NULL,
--     estacao_uuid   UUID,
--     mac_address    VARCHAR(20),
--     unixtime       BIGINT,
--     processado     BOOLEAN      NOT NULL DEFAULT FALSE,
--     criado_em      TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
--     processado_em  TIMESTAMPTZ,
--     tentativas     SMALLINT     NOT NULL DEFAULT 0,
--     ultimo_erro    TEXT,
--     PRIMARY KEY (id, criado_em)
-- ) PARTITION BY RANGE (criado_em);
--
-- -- Uma particao por mes (criar com antecedencia, via job mensal):
-- CREATE TABLE staging_telemetria_2026_09 PARTITION OF staging_telemetria
--     FOR VALUES FROM ('2026-09-01') TO ('2026-10-01');
-- CREATE TABLE staging_telemetria_2026_10 PARTITION OF staging_telemetria
--     FOR VALUES FROM ('2026-10-01') TO ('2026-11-01');
--
-- -- Descartar um mes inteiro depois da retencao (instantaneo):
-- DROP TABLE staging_telemetria_2026_09;


-- ############################################################################
-- PARTE 4 - MANUTENCAO E OPERACAO DE LONGO PRAZO
-- ############################################################################

-- ============================================================================
-- 1. Dimensionamento: o que realmente cresce
-- ============================================================================
--
-- Estimativa com 20 estacoes x 4 sensores, enviando a cada 15 minutos:
--
--   80 sensores x 96 leituras/dia         = 7.680 linhas/dia em 'medidas'
--   7.680 x 365                           = ~2,8 milhoes de linhas/ano
--   em 5 anos                             = ~14 milhoes de linhas
--
-- 14 milhoes de linhas com indice adequado e um volume que o PostgreSQL trata
-- sem dificuldade. Ou seja: a tabela 'medidas' NAO precisa de particionamento
-- nesta escala. O que precisa de atencao e o staging, que tem rotatividade
-- constante, e as consultas de agregacao do dashboard.
--
-- Se o numero de estacoes crescer uma ordem de grandeza (200+), revisar
-- a decisao e considerar particionar 'medidas' por ano.


-- ============================================================================
-- 2. Indice para as consultas de dashboard
-- ============================================================================
--
-- O painel historico sempre pergunta "leituras do sensor X nas ultimas 24h".
-- Sem indice composto, o banco varre a tabela inteira - o que funciona com
-- 10 mil linhas e trava com 10 milhoes.
-- (Este indice ja esta no 01_schema.sql; repetido aqui como documentacao.)
--
-- CREATE INDEX idx_medidas_sensor_tempo ON medidas (sensor_id, unixtime DESC);


-- ============================================================================
-- 3. Agregacao historica (opcional, a partir do 2o ano)
-- ============================================================================
--
-- Ninguem precisa da leitura de minuto a minuto de tres anos atras. Para
-- relatorios antigos, medias horarias ou diarias bastam e ocupam uma fracao
-- do espaco.
--
-- A estrategia: manter o dado bruto dos ultimos N meses e, para o periodo
-- anterior, guardar apenas o resumo agregado.

CREATE TABLE IF NOT EXISTS medidas_resumo_diario (
    id            BIGSERIAL     PRIMARY KEY,
    sensor_id     UUID          NOT NULL REFERENCES sensores(id) ON DELETE RESTRICT,
    dia           DATE          NOT NULL,
    valor_minimo  NUMERIC(12,4) NOT NULL,
    valor_maximo  NUMERIC(12,4) NOT NULL,
    valor_medio   NUMERIC(12,4) NOT NULL,
    total_leituras INT          NOT NULL,

    CONSTRAINT uq_resumo_sensor_dia UNIQUE (sensor_id, dia)
);

COMMENT ON TABLE medidas_resumo_diario IS
    'Resumo diario por sensor. Permite manter analise historica de anos '
    'sem carregar o volume bruto completo.';

CREATE INDEX IF NOT EXISTS idx_resumo_sensor_dia
    ON medidas_resumo_diario (sensor_id, dia DESC);


-- Consolida um dia inteiro de leituras em uma unica linha por sensor.
-- Idempotente: pode rodar novamente sobre o mesmo dia sem duplicar.
CREATE OR REPLACE FUNCTION fn_consolidar_dia(dia_alvo DATE)
RETURNS INT AS $$
DECLARE
    linhas INT;
BEGIN
    INSERT INTO medidas_resumo_diario
        (sensor_id, dia, valor_minimo, valor_maximo, valor_medio, total_leituras)
    SELECT
        sensor_id,
        dia_alvo,
        MIN(valor),
        MAX(valor),
        AVG(valor),
        COUNT(*)
    FROM medidas
    WHERE to_timestamp(unixtime)::DATE = dia_alvo
    GROUP BY sensor_id
    ON CONFLICT (sensor_id, dia) DO UPDATE SET
        valor_minimo   = EXCLUDED.valor_minimo,
        valor_maximo   = EXCLUDED.valor_maximo,
        valor_medio    = EXCLUDED.valor_medio,
        total_leituras = EXCLUDED.total_leituras;

    GET DIAGNOSTICS linhas = ROW_COUNT;
    RETURN linhas;
END;
$$ LANGUAGE plpgsql;


-- ============================================================================
-- 4. Monitoramento de crescimento
-- ============================================================================
--
-- Rode esta view uma vez por mes. Se alguma tabela estiver crescendo mais rapido
-- que o esperado, e sinal para investigar antes de virar problema.

CREATE OR REPLACE VIEW vw_tamanho_tabelas AS
SELECT
    relname                                        AS tabela,
    n_live_tup                                     AS linhas_aproximadas,
    pg_size_pretty(pg_total_relation_size(relid))  AS tamanho_total,
    pg_size_pretty(pg_indexes_size(relid))         AS tamanho_indices,
    last_autovacuum,
    last_autoanalyze
FROM pg_stat_user_tables
ORDER BY pg_total_relation_size(relid) DESC;


-- ============================================================================
-- 5. Checklist de operacao continua
-- ============================================================================
--
-- DIARIO
--   - Executar fn_limpar_staging(7) para remover mensagens ja processadas.
--   - Conferir vw_saude_staging: se 'pendentes' so cresce, o servico-validacao
--     nao esta acompanhando o volume de ingestao.
--
-- SEMANAL
--   - Conferir se ha registros com tentativas > 0 e nao processados
--     (mensagens que falharam e ficaram presas).
--
-- MENSAL
--   - Consultar vw_tamanho_tabelas e comparar com o mes anterior.
--   - Conferir se o autovacuum esta rodando (colunas last_autovacuum).
--
-- ANUAL
--   - Avaliar se vale consolidar o ano anterior com fn_consolidar_dia.
--   - Revisar se o volume ainda cabe no dimensionamento da secao 1.
--
-- SEMPRE
--   - Backup automatizado do banco relacional. O staging pode ser perdido sem
--     grande impacto, mas 'medidas', 'estacoes' e 'usuarios' nao.
