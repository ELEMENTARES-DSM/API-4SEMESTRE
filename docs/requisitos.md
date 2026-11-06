<p align="center">
[🏠 Início](../README.md) · [Backlog](backlog.md) · [Sprint 1](sprints/sprint-1.md) · [Sprint 2](sprints/sprint-2.md) · [Sprint 3](sprints/sprint-3.md) · **Requisitos** · [Arquitetura](arquitetura.md) · [Processo](processo.md) · [Qualidade](qualidade.md) · [Instalação](instalacao.md)
</p>

# 📋 Requisitos do Sistema

> Os códigos RF/RNF seguem a numeração oficial definida com o cliente. Os RF-11 a RF-29 e os RNF-06 a RNF-14 são sub-requisitos derivados dos originais e das respostas do cliente, conforme as páginas de Requisitos Funcionais e Não Funcionais do Confluence.

**Requisitos Funcionais (RF):**

* **RF-01 — Modelo de Dados Dinâmico:** o cadastro de sensores aceita qualquer grandeza (temperatura, umidade, PM2.5, vento, pressão e outras) através de um catálogo de grandezas mantido pelo Administrador, sem exigir alteração de código ou de schema para adicionar um novo tipo de sensor.
* **RF-02 — CRUD de Estações, Parâmetros, Alertas e Usuários:** criação, listagem, edição e inativação lógica (nunca exclusão física) de estações, sensores, regras de alerta, contas e papéis — preservando o histórico de medições vinculado.
* **RF-03 — Recepção de Dados:** ingestão via protocolo MQTT, com gravação imediata no banco temporário (Valkey) e processamento assíncrono via RabbitMQ, garantindo que uma falha no processamento não descarte a leitura de campo.
* **RF-04 — Dashboards:** painéis exibindo a classificação de qualidade do ar (IQAr) em tempo real e o status de disponibilidade de cada estação (Ativa / Com Falha / Inativa), sempre isolados por município.
* **RF-05 — Geração de Alertas:** disparo automático de evento quando uma leitura calibrada viola o limiar de uma regra ativa, publicado no RabbitMQ e consumido pelo `alertas-notificacoes` — sem depender de consulta periódica ao banco.
* **RF-06 — Datalogger:** módulo embarcado na estação física responsável por registrar as leituras brutas dos sensores antes do envio via MQTT.
* **RF-07 — Estação Meteorológica:** construção física da estação de baixo custo com sensores de temperatura, umidade, PM2.5, vento e pressão, integrada ao datalogger.
* **RF-08 — Controle de Acesso:** autenticação via JWT com os perfis Administrador, Gestor Público, Pesquisador e Munícipe, mais o acesso sem login (visitante) ao painel público, e isolamento territorial — um Gestor Público só acessa dados do seu próprio município.
* **RF-09 — Relatórios:** exportação em PDF/CSV do histórico de medições e alarmes de um município, para auditoria e acompanhamento pela gestão municipal.
* **RF-10 — Análise Estatística:** aplicação de estatística sobre a série histórica de qualidade do ar e clima, para identificar padrões e tendências ambientais ao longo do tempo.
* **RF-11 — Gestão de Contas de Usuário:** o Administrador cadastra, lista, inativa, reativa e troca o papel das contas (Administrador, Gestor Público, Pesquisador ou Munícipe). Qualquer pessoa pode criar a própria conta, que nasce com o papel Munícipe. O e-mail é único no sistema, o Gestor Público precisa ter município, e a conta inativada perde o acesso sem que o registro seja apagado. _(Deriva de RF-02 e RF-08.)_
* **RF-12 — Autenticação e Sessão:** o usuário entra com e-mail e senha e recebe uma sessão com prazo de validade. Credencial errada recebe uma mensagem que não revela se o e-mail existe, conta inativa é recusada e, sem sessão válida, o usuário volta para o login. _(Deriva de RF-08.)_
* **RF-13 — Autorização por Perfil e Isolamento por Município:** cada função fica disponível só para os perfis autorizados. O Gestor Público vê e altera apenas dados do seu município, e as funções administrativas (gestão de contas, métricas e reenvio de falhas) são exclusivas do Administrador. _(Deriva de RF-08.)_
* **RF-14 — Gestão de Estações:** cadastrar, listar e inativar as estações meteorológicas do município, com código único, nome e coordenadas válidas (latitude e longitude). A estação inativada mantém o histórico de medições. _(Deriva de RF-02.)_
* **RF-15 — Disponibilidade das Estações:** painel por município com a situação de cada estação (Ativa, Com Falha ou Inativa), o total de cada situação e o tempo desde o último sinal. A estação passa a Com Falha depois de 15 minutos sem sinal (3 ciclos de 5 minutos); a estação inativada aparece como Inativa e não conta como falha. _(Deriva de RF-04.)_
* **RF-16 — Gestão de Sensores e Calibração:** cadastrar, listar e inativar os sensores de uma estação, informando grandeza, unidade de medida, fator e ganho de calibração. Qualquer grandeza do catálogo pode ser usada sem alterar o sistema. _(Deriva de RF-01 e RF-02.)_
* **RF-17 — Gestão de Regras de Alerta:** cadastrar, listar e inativar regras de alerta ligadas a um sensor do município, com operador de comparação (>, >=, <, <=, =), valor limite dentro da faixa física da grandeza e severidade. Regra inativa não gera alerta. _(Deriva de RF-02 e RF-05.)_
* **RF-18 — Recebimento das Leituras via MQTT:** o sistema recebe as leituras publicadas por todas as estações via MQTT, identifica a estação pelo tópico e guarda o conteúdo como chegou, com o horário de recebimento. Se a conexão cair, o sistema reconecta sozinho sem perder as leituras publicadas nesse intervalo. _(Deriva de RF-03.)_
* **RF-19 — Validação das Leituras Recebidas:** toda leitura recebida é conferida antes de seguir: formato combinado (horário, lista de leituras e nível de bateria entre 0 e 100) e estação cadastrada e ativa. A leitura recusada é registrada com o motivo, e a recusa de uma leitura não impede as demais. _(Deriva de RF-03.)_
* **RF-20 — Descarte de Leituras Duplicadas:** uma leitura da mesma estação com o mesmo horário é processada uma única vez, mesmo que chegue repetida ou ao mesmo tempo. A repetição é descartada sem ser tratada como erro. _(Deriva de RF-03.)_
* **RF-21 — Gravação Imediata no Banco Temporário:** toda mensagem recebida, aceita ou recusada, é gravada no banco temporário (Valkey) antes de qualquer processamento. A mensagem aceita atualiza o último sinal e o nível de bateria da estação. Se o banco temporário falhar, a mensagem não é descartada. _(Deriva de RF-03.)_
* **RF-22 — Encaminhamento Assíncrono sem Perda:** as leituras gravadas seguem para processamento por fila, sem que a recepção espere o processamento terminar. Se a fila estiver fora do ar, as leituras ficam pendentes e são reenviadas automaticamente, na ordem de chegada, quando ela voltar. _(Deriva de RF-03.)_
* **RF-23 — Simulação de Estações:** um simulador publica leituras no mesmo formato e pelo mesmo canal da estação física, com quantidade de estações, intervalo de envio e tipos de defeito configuráveis. _(Deriva de RF-03 e RF-07.)_
* **RF-24 — Calibração e Gravação das Medidas:** cada leitura válida é convertida em valor real pela fórmula (valor bruto × fator) + ganho do sensor, sem erro de arredondamento, e gravada com o horário da estação. A mesma medida nunca é gravada duas vezes, e as leituras de uma mensagem são gravadas juntas ou nenhuma é gravada. _(Deriva de RF-01 e RF-03.)_
* **RF-25 — Leituras de Sensor Inexistente ou Inativo:** a leitura de um sensor que não existe vai para a fila de falhas com o motivo. A leitura de um sensor inativado é descartada e contabilizada. As demais leituras da mesma mensagem seguem normalmente. _(Deriva de RF-03.)_
* **RF-26 — Medidas Fisicamente Impossíveis:** uma medida fora da faixa física possível da grandeza (por exemplo, umidade acima de 100%) é gravada marcada como inválida e não entra em dashboards, relatórios, análises nem alertas. _(Deriva de RF-03.)_
* **RF-27 — Reprocessamento de Falhas:** se o banco de dados estiver indisponível, nenhuma leitura é perdida: o processamento espera e retoma. A leitura que falha repetidas vezes vai para a fila de falhas, e o Administrador pode reenviá-la depois de corrigir a causa. _(Deriva de RF-03.)_
* **RF-28 — Dados Abertos das Medições:** o painel público mostra, sem login, os últimos 7 dias. A API pública, documentada no padrão OpenAPI, permite consultar e baixar em CSV as medições a quem tem conta, e registra quem consultou e baixou. _(Deriva de RF-04 e RF-09.)_
* **RF-29 — Período e Cota da API por Perfil:** cada perfil tem um período máximo por consulta e uma cota semanal e mensal de pedidos à API pública. Ao esgotar a cota, o pedido é recusado com a data em que ela renova. _(Deriva de RF-13 e RF-28.)_

**Requisitos Não Funcionais (RNF):**

* **RNF-01 — Experiência do Usuário (UX):** interface com Dark Mode exibindo badges de severidade (Informativo/Alerta/Crítico) e status de estação de forma visualmente imediata, sem exigir leitura de texto para identificar risco.
* **RNF-02 — Documentação de APIs:** rotas documentadas com exemplo de requisição e resposta, priorizadas conforme o cliente definiu: manual de instalação, rotas da API, modelo de dados, arquitetura e manual do usuário, nesta ordem.
* **RNF-03 — Integração Contínua (CI):** esteira no GitHub Actions com validação de tipos TypeScript, lint e suíte de testes, bloqueando merge em caso de falha — branches `main` e `develop` dos repositórios de código protegidas por *ruleset*.
* **RNF-04 — Deploy Automatizado (CD):** entrega contínua para homologação e produção, acionada após aprovação de Pull Request.
* **RNF-05 — Robustez e Escalabilidade:** suporte a picos de acesso simultâneo, especialmente quando um alerta crítico é disparado e a consulta ao painel público tende a aumentar de repente. A recepção de dados é a função mais crítica: uma falha no dashboard é reversível consultando depois, uma falha na ingestão perde a leitura daquele período para sempre.
* **RNF-06 — Instalação Reproduzível em Máquina Limpa:** qualquer pessoa consegue instalar e executar o sistema completo do zero, numa máquina limpa, seguindo um procedimento documentado, com o ambiente em contêineres e versões fixas, sem instalar dependências manualmente. _(Deriva de RNF-02.)_
* **RNF-07 — Custo e Transferência de Tecnologia:** (requisito organizacional) o projeto documenta o custo de implantação e de operação (equipe, infraestrutura e estação) para comprovar a viabilidade de baixo custo e permitir a transferência da tecnologia. _(Deriva de RNF-02.)_
* **RNF-08 — Qualidade Verificada por Testes:** a lógica de negócio crítica tem testes automatizados executados na integração contínua, com cobertura mínima de 70% (meta do time), e os critérios de aceitação são conferidos antes de concluir cada item. _(Deriva de RNF-03.)_
* **RNF-09 — Arquitetura de Serviços Independentes:** cada responsabilidade (autenticação, gestão de estações, recepção, validação, alertas e relatórios) roda em um serviço próprio. Os serviços se comunicam por API REST ou por fila, e o frontend acessa os dados só pela API. A queda de um serviço de consulta não interrompe a recepção de dados. _(Deriva de RNF-05.)_
* **RNF-10 — Capacidade:** o sistema suporta uma leitura por estação a cada 5 minutos, para todas as estações cadastradas, e 50 usuários simultâneos, com as consultas do painel respondendo em menos de 200 ms (meta do time). _(Deriva de RNF-05.)_
* **RNF-11 — Observabilidade do Fluxo de Dados:** os serviços informam a sua saúde (conexão com broker, fila e banco) e os contadores do fluxo (recebidas, recusadas por motivo, duplicadas, pendentes, inválidas e na fila de falhas), consultáveis apenas pelo Administrador. _(Deriva de RNF-05.)_
* **RNF-12 — Segurança de Credenciais:** senhas são guardadas apenas como hash; o token de sessão é assinado e tem validade; segredos (chave do token, senhas de banco, do Valkey e do broker) ficam fora do código e do repositório; cada estação e serviço precisa de credencial própria para publicar ou ler no broker. _(Deriva de RF-08.)_
* **RNF-13 — Retenção dos Dados:** as medidas são mantidas enquanto o projeto existir, sem expurgo automático. Cadastros (usuários, estações, sensores e regras) nunca são excluídos fisicamente, apenas inativados. Só o banco temporário é limpo, 7 dias depois de a leitura ser entregue à fila durável.
* **RNF-14 — Rastreabilidade do Requisito ao Código:** (requisito organizacional) todo item do backlog no Jira tem prioridade, responsável, estimativa, critérios de aceitação e requisito associado, e todo commit e Pull Request cita a chave do item no Jira.


### 📐 Variáveis Monitoradas

O escopo de sensores do MVP foi definido a partir da dor do cliente: cada variável coletada existe porque ajuda a caracterizar as condições ambientais e a qualidade do ar do município. O catálogo de grandezas (US-39) começa com estas 7 e com o PM10, que o cadastro já aceitava; o Administrador pode cadastrar outras sem mudar o código.

| Variável             | Unidade | Por que está no escopo                                                                                                             |
| --------------------- | :-----: | ----------------------------------------------------------------------------------------------------------------------------------- |
| Temperatura           |   °C   | Variável mais diretamente observável para identificar diferenças térmicas entre regiões (ilhas de calor).                      |
| Umidade Relativa      |    %    | Interfere nas trocas de energia da atmosfera e caracteriza condições de baixa umidade, relevantes para a dispersão de poluentes. |
| PM2.5                 | µg/m³ | Partícula fina em suspensão, um dos principais indicadores de qualidade do ar em áreas urbanas.                                  |
| Velocidade do Vento   |  km/h  | Determina o transporte e a dispersão dos poluentes a partir da fonte.                                                              |
| Direção do Vento    |   °   | Indica de onde vem o poluente e quais áreas tendem a ser afetadas.                                                                 |
| Precipitação        |   mm   | Influencia a remoção de material particulado suspenso na atmosfera.                                                               |
| Pressão Atmosférica |   hPa   | Condiciona a estagnação ou dispersão do ar próximo à superfície.                                                              |

> **Fora da análise do MVP:** PM10 (o cadastro aceita, mas ele não entra nos painéis), O₃, NO₂, CO₂, radiação solar/UV, variáveis de solo e de nuvens. Com o catálogo de grandezas (US-39), qualquer uma delas pode ser cadastrada depois sem mudar o código.

---

<p align="center">[← Sprint 3](sprints/sprint-3.md) | [Arquitetura →](arquitetura.md)</p>
