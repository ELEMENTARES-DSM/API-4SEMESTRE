# API DSM - 4º SEMESTRE 2026

<h2 align="center"> ELEMENTARES </h2>

<p align="center">
  <a href="#sobre">Visão Geral</a> |
  <a href="#backlog">Produto</a> |
  <a href="#engenharia">Engenharia e DevOps</a> |
  <a href="#qualidade">Testes e Qualidade</a> |
  <a href="#cronograma">Cronograma</a> |
  <a href="#manuais">Manuais</a> |
  <a href="#tecnologias">Tecnologias</a> |
  <a href="#equipe">Nossa Equipe</a>
</p>

> **Fase Atual:** Sprint 1 — Fundação, Governança e Ativos IoT 🚀

### 🔗 Links Rápidos

| Recurso | Link |
| ------- | :--: |
| 📋 Board do Produto (Jira) | [Acessar Backlog](https://elementares-4sem.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog) |
| 🖥️ Repositório Backend | [BACKEND-4SEMESTRE](https://github.com/ELEMENTARES-DSM/BACKEND-4SEMESTRE) |
| 🎨 Repositório Frontend | [FRONTEND-4SEMESTRE](https://github.com/ELEMENTARES-DSM/FRONTEND-4SEMESTRE) |
| 📄 Documentação e Artefatos da Sprint | [`/docs`](docs/) |
| 👥 GitHub e LinkedIn do time | [Ver seção Nossa Equipe](#equipe) |

---

## 🎯 Visão Geral <a id="sobre"></a>

### 🏢 Parceiro de Negócio (Cliente)

**Diogo Branquinho** (Representando a empresa **TECSUS**).

A [Tecsus](https://www.tecsus.com.br/) é uma empresa de tecnologia especializada em soluções inteligentes para o controle e gestão de utilidades (água, energia e gás) em empresas com múltiplas unidades. Com mais de 10 anos de mercado, a Tecsus atua ajudando negócios a obter visibilidade sobre seus consumos, reduzir desperdícios e automatizar processos operacionais com eficiência e inovação. Seu foco está muito alinhado com as práticas de ESG (Ambiental, Social e Governança), buscando sempre uma gestão sustentável e inteligente.

### ⚠️ A Dor

Secretarias de Saúde municipais não conseguem antecipar aumentos na demanda por atendimentos respiratórios porque não possuem dados ambientais estruturados e contínuos que permitam analisar sua relação com os atendimentos. Sem um histórico confiável de condições como temperatura, umidade e concentração de PM2.5, torna-se difícil investigar quais condições ambientais podem estar associadas ao aumento da demanda e utilizar essas informações para apoiar ações preventivas.

### 🚀 O Desafio

Construir uma plataforma capaz de capturar continuamente dados de estações meteorológicas de baixo custo, processá-los de forma confiável e disponibilizá-los como série histórica estruturada — assegurando isolamento territorial entre municípios do consórcio, controle de acesso por perfil e resiliência na ingestão, de modo que nenhuma leitura de campo seja perdida.

### ✨ A Solução

O **Pulso Urbano** classifica a qualidade do ar coletada em tempo real segundo o **Índice de Qualidade do Ar (IQAr)**, padrão nacional oficial (Lei Federal nº 14.850/2024 e Resolução CONAMA nº 506/2024) que associa cada faixa de concentração de poluentes a efeitos documentados sobre a saúde — com atenção especial a grupos vulneráveis, incluindo pessoas com doenças respiratórias. Quando os níveis atingem uma faixa considerada prejudicial, a plataforma dispara alerta automático para a Secretaria de Saúde, permitindo ação preventiva antes que o quadro se agrave.

Uma rede de estações ambientais de baixo custo, compartilhada entre municípios do consórcio, alimenta essa classificação continuamente — entregando à Secretaria tanto o alerta imediato quanto uma base histórica estruturada para, futuramente, cruzar com seus próprios registros de atendimento e investigar padrões que hoje passam despercebidos.

---

## 📌 Produto <a id="backlog"></a>

### 🎯 Meta da Sprint 1

Entregar a fundação da plataforma — contas, autenticação, estações e sensores calibrados — com a lógica de **monitoramento de disponibilidade das estações** e de **classificação de qualidade do ar (IQAr)** já implementada e validada por testes automatizados. Esse é o compromisso apresentado ao cliente como **1ª Entrega** do projeto.

### 📋 Backlog do Produto

O backlog segue a classificação de itens definida pelo cliente: **User Stories de negócio** (valor direto ao usuário) e **Itens Técnicos / Infraestrutura** (engenharia habilitadora) convivem na mesma numeração sequencial, cada um com seu ticket rastreável no Jira. A coluna **Rank** reflete a ordem de dependência de implementação, não apenas a ordem numérica.

| Rank | US | Tipo | Valor de Negócio | História | Épico | Ticket | Requisitos | Pontos | Sprint |
| :--: | :--: | :--: | ----------------- | -------- | ----- | :----: | :--------: | :----: | :----: |
| 1 | **US-01** | Negócio | Sem controle de identidade e papéis, nenhuma outra funcionalidade pode restringir acesso por perfil — é o alicerce de todo o isolamento territorial do produto. | Como administrador, quero gerenciar contas e papéis hierárquicos para controlar o acesso de gestores e pesquisadores na plataforma. | EPIC-01 | ELEM-6 | RF-02, RF-08 | 5 | 1 |
| 2 | **US-02** | Negócio | Garante que cada usuário só opere dentro do que seu perfil permite; sem isso, o isolamento territorial da US-01 não é aplicado em tempo de uso. | Como usuário cadastrado, quero me autenticar com credenciais corporativas e sessão segura para acessar as áreas e dados restritos ao meu perfil. | EPIC-01 | ELEM-11 | RF-08 | 3 | 1 |
| 3 | **US-03** | Negócio | Sem estação cadastrada não existe fonte de dado nenhuma — é a entidade central de todo o pipeline de coleta. | Como gestor público, quero cadastrar e gerenciar estações meteorológicas georreferenciadas para manter o inventário territorial sob governança municipal. | EPIC-02 | ELEM-16 | RF-01, RF-02 | 5 | 1 |
| 4 | **US-05** | Negócio | Sem calibração correta, os valores de PM2.5 e temperatura ficam incorretos — inviabiliza a classificação de qualidade do ar prometida na 1ª Entrega. | Como gestor público, quero parametrizar e calibrar os sensores associados às estações para que as leituras brutas sejam convertidas em grandezas reais. | EPIC-02 | ELEM-27 | RF-01, RF-02 | 5 | 1 |
| 5 | **US-04** | Negócio | Entrega nomeada na 1ª Entrega ao cliente: garante que uma falha de campo seja percebida pela Secretaria antes que vire lacuna nos dados. | Como gestor público, quero monitorar a conectividade e disponibilidade das estações para identificar quedas de sinal e falhas operacionais. | EPIC-03 | ELEM-23 | RF-03 | 8 | 1 |
| 6 | **US-06** | Negócio | É o motor do IQAr: converte leitura calibrada em alerta de saúde acionável — a entrega central do MVP apresentada ao cliente. | Como técnico da Defesa Civil, quero configurar regras de alerta e limiares críticos para disparar avisos preventivos em condições ambientais severas. | EPIC-03 | ELEM-32 | RF-02, RF-05 | 8 | 1 |
| — | **US-07** | Técnico | Garante que qualquer avaliador, incluindo o cliente, entenda o estado real do projeto sem depender de explicação verbal. | Como membro da equipe Elementares, quero manter a documentação do projeto centralizada, atualizada e vinculada aos tickets do Jira, para garantir que qualquer integrante ou avaliador externo compreenda o estado real do projeto sem depender de explicação verbal. | EPIC-04 | ELEM-58 | RNF-02 | 3\* | 1-3 (contínuo) |
| — | **US-08** | Técnico | Reduz o tempo de setup e evita divergência de ambiente entre máquinas — o custo de não fazer isso aparece como bug em produção depois. | Como desenvolvedor da equipe Elementares, quero ter os repositórios organizados com estrutura de pastas padronizada e ambiente de desenvolvimento reproduzível, para garantir que qualquer integrante trabalhe sobre a mesma base técnica, reduzindo divergência de ambiente e tempo de configuração. | EPIC-04 | ELEM-59 | RNF-03 | 3\* | 1-3 (contínuo) |
| — | **US-09** | Técnico | Garante que uma falha de qualidade seja detectada antes de chegar ao usuário final — sustenta a confiabilidade prometida ao cliente. | Como responsável por QA da equipe Elementares, quero definir processos de validação de qualidade e monitorar continuamente a saúde da API, do banco de dados e da esteira de integração, para identificar problemas antes que cheguem ao usuário final e garantir critério objetivo de aprovação das entregas. | EPIC-04 | ELEM-60 | RNF-05 | 3\* | 1-3 (contínuo) |
| — | **US-10** | Técnico | Garante que nenhuma entrega futura quebre o que já foi validado com o cliente nesta Sprint. | Como desenvolvedor da equipe Elementares, quero implementar uma suíte de testes automatizados que cubra a lógica de negócio crítica e a integração entre a API e o banco de dados, para garantir que nenhuma alteração futura quebre funcionalidades já validadas com o cliente em sprints anteriores. | EPIC-04 | ELEM-61 | RNF-03 | 3\* | 1-3 (contínuo) |
| 7 | **US-11** | Negócio | É a entrega que o cliente pediu explicitamente para a Sprint 2: pipeline real de ponta a ponta, não mais simulado. | Como Gestor Público Municipal, quero que os dados enviados pelas estações sejam recebidos, calibrados e avaliados automaticamente de ponta a ponta, disparando alerta quando necessário, para que o monitoramento funcione de forma contínua e confiável, sem depender de simulação manual. | EPIC-03 | _a criar_ | RF-03, RF-05, RNF-05 | 13\*\* | 2 |
| 8 | **US-12** | Negócio | Sem visualização histórica, a Secretaria não consegue identificar tendência nenhuma — só o instante presente. | Como Gestor Público Municipal, quero visualizar dashboards com a série histórica de qualidade do ar e o status das estações, para acompanhar tendências e tomar decisões com base em dados consolidados. | EPIC-03 | _a criar_ | RF-04 | 8\*\* | 2 |
| 9 | **US-13** | Negócio | Exigido explicitamente pelo cliente (RF-09) para auditoria formal das medições. | Como Gestor Público Municipal, quero gerar relatórios em formato exportável (PDF/CSV) com os dados coletados, para auditar medições ambientais históricas do município. | EPIC-03 | _a criar_ | RF-09 | 8\*\* | 2 |
| 10 | **US-14** | Negócio | É o item que conecta o dado ambiental ao problema de saúde pública — o motivo de existir do projeto, segundo a dor original. | Como Pesquisador, quero aplicar análises estatísticas sobre as séries históricas de qualidade do ar, para investigar a relação entre condições ambientais e a demanda por atendimentos respiratórios. | EPIC-03 | _a criar_ | RF-10 | 13\*\* | 2 |
| 11 | **US-15** | Negócio | Entrega o acesso sem cadastro ao munícipe — o terceiro perfil de usuário previsto desde a visão de produto. | Como Munícipe, quero consultar um painel público com os índices ambientais do meu município sem precisar de conta, para acompanhar a qualidade do ar do meu dia a dia. | EPIC-03 | _a criar_ | RF-04, RNF-01 | 8\*\* | 3 |
| 12 | **US-16** | Negócio | Substitui a simulação por operação real de campo — fecha o ciclo iniciado com o simulador da Sprint 1/2. | Como Gestor Público Municipal, quero que os dados sejam recebidos diretamente do datalogger instalado na estação física real, para que a plataforma opere com hardware de campo em vez de dados simulados. | EPIC-03 | _a criar_ | RF-06, RF-07 | 13\*\* | 3 |
| 13 | **US-17** | Negócio | Garante que o alerta chegue rápido o suficiente para ser útil, não só que ele exista. | Como Técnico da Defesa Civil, quero que os alertas sejam entregues com latência mínima e por múltiplos canais simultaneamente, para garantir resposta rápida em situações climáticas críticas. | EPIC-03 | _a criar_ | RF-05 | 5\*\* | 3 |
| — | **US-18** | Técnico | Valida que a plataforma aguenta o volume real de acesso quando o Portal Público (US-15) entrar no ar. | Como Squad de Engenharia, quero validar e otimizar a performance da plataforma sob alto volume de acessos simultâneos, para garantir estabilidade quando o Portal Público entrar em operação. | EPIC-04 | _a criar_ | RNF-05 | 8\*\* | 3 |

> **Pontos:** US-01 a US-06 somam 34 Story Points, consenso de Planning Poker (sequência de Fibonacci) — medem valor de negócio. \*Os 3 pontos de US-07 a US-10 são uma estimativa nominal de esforço de engenharia **por sprint** em que houver trabalho ativo (setup inicial na Sprint 1, manutenção e verificação nas Sprints 2 e 3), para fins de organização e apontamento de horas — **não fazem parte** do consenso de Planning Poker das histórias de negócio. \*\*Estimativas de US-11 a US-18 são **preliminares, propostas pelo PO** — ainda não passaram por Planning Poker com o squad completo. Serão revalidadas na Sprint Planning de cada sprint.

**Épicos:** `EPIC-01` Gestão de Acessos e Perfis de Usuários · `EPIC-02` Inventário Territorial de Estações e Sensores · `EPIC-03` Monitoramento Operacional e Gestão de Alertas · `EPIC-04` Engenharia de Plataforma, DevOps e Qualidade (Técnico).

> **Entrega de valor vs. suporte contínuo:** apenas **US-01 a US-06** entregam valor direto ao cliente — são o que ele vê, usa e valida a cada Sprint. **US-07 a US-10 nunca entregam valor de negócio isoladamente**: são qualidade, documentação e infraestrutura de engenharia, mantidas continuamente ao longo das 3 sprints para que as histórias de negócio possam ser entregues de forma confiável.

#### Por que estas 10 entregas estão priorizadas agora

As seis histórias de negócio (US-01 a US-06) formam uma cadeia de dependência única, sem ramificação: contas → autenticação → cadastro de estações → calibração de sensores → monitoramento de disponibilidade → regras de alerta. **Nenhuma pode ser adiada isoladamente** sem quebrar a que vem depois, e juntas elas são, literalmente, o texto da 1ª Entrega já apresentada ao cliente. Os quatro itens técnicos (US-07 a US-10) não entregam valor direto ao usuário final, mas são pré-requisito de qualidade para que as seis anteriores sejam entregues de forma rastreável, testada e reproduzível — por isso correm em paralelo desde o início da Sprint, e não appareceram na sequência (`Rank: —`).

**Por que US-07 a US-10 atravessam as 3 sprints:** diferente das histórias de negócio, que têm um ponto de conclusão claro (a regra foi cadastrada, o alerta dispara), processos de engenharia não "terminam" — documentação, CI, QA e testes precisam ser mantidos e verificados a cada entrega, não só configurados uma vez. Por isso elas aparecem com Sprint `1-3 (contínuo)`: a Sprint 1 cobre a definição e o setup inicial (ferramenta escolhida, processo documentado, pipeline configurado); as Sprints 2 e 3 cobrem a aplicação e a verificação desse processo contra o código novo que entra a cada sprint.

### 🏃 Sprint Backlog — Sprint 1

Recorte operacional do Product Backlog para esta Sprint: o que é **compromisso** firmado com o cliente, quem executa, e como cada item comprova a Definition of Ready.

**Entregas de valor da Sprint 1 (US-01 a US-06)**

| Capacidade estimada pela equipe por Sprint | 34 Story Points (consenso de Planning Poker) |
| ------------------------------------------- | :--------------------------------------------: |
| **Meta da Sprint** | US-01 a US-06 — fundação da plataforma, monitoramento de disponibilidade e classificação de qualidade do ar (IQAr), conforme a 1ª Entrega apresentada ao cliente |
| **Previsão da Sprint (extras, sem compromisso de entrega)** | Nenhuma — a capacidade da Sprint 1 já está integralmente ocupada pelas seis histórias de negócio. US-07 a US-10 rodam em paralelo como suporte contínuo e não entram nesse cálculo de capacidade de valor |

| Rank | Prioridade | User Story | Estimativa | Sprint |
| :--: | :--------: | ----------- | :--------: | :----: |
| 01 | Alta | Como Administrador do Sistema (Governança Municipal / Consórcio), quero cadastrar, listar, associar papéis hierárquicos e inativar logicamente contas de usuários no sistema, para garantir que gestores públicos e pesquisadores acessem estritamente os recursos e dados autorizados sob governança municipal. | 5 | 1 |
| 02 | Alta | Como usuário cadastrado (Administrador, Gestor Público ou Pesquisador), quero me autenticar com credenciais institucionais e manter minha sessão ativa de forma segura, para acessar os painéis de monitoramento e as ferramentas restritas ao meu perfil. | 3 | 1 |
| 03 | Alta | Como Gestor Público Municipal, quero cadastrar e gerenciar estações meteorológicas georreferenciadas, para manter o inventário territorial sob governança municipal e habilitar a coleta de dados ambientais. | 5 | 1 |
| 04 | Alta | Como Gestor Público Municipal, quero monitorar a conectividade e disponibilidade das estações, para identificar quedas de sinal e falhas operacionais antes que virem lacuna nos dados. | 8 | 1 |
| 05 | Alta | Como Gestor Público Municipal, quero parametrizar e calibrar os sensores associados às estações, para que as leituras brutas sejam convertidas com precisão em grandezas reais. | 5 | 1 |
| 06 | Alta | Como técnico da Defesa Civil, quero configurar regras de alerta e limiares críticos por sensor, para disparar avisos preventivos automáticos quando condições ambientais severas forem detectadas. | 8 | 1 |

**Itens técnicos de suporte contínuo (US-07 a US-10)**

| Documentação e Rastreabilidade do Projeto (US-07) | Estruturação de Repositórios (US-08) | Observabilidade e QA (US-09) | Estratégia de Testes (US-10) |
| :--: | :--: | :--: | :--: |
| 3 pts\* — contínuo (Sprints 1-3) | 3 pts\* — contínuo (Sprints 1-3) | 3 pts\* — contínuo (Sprints 1-3) | 3 pts\* — contínuo (Sprints 1-3) |

**Recorte completo de rastreabilidade (todas as 10 USs)**

| US | Compromisso / Previsão | Responsável | Estimativa | Critério de Aceite | DoR Verificado |
| :--: | :---------------------: | :----------: | :--------: | :-----------------: | :--------------: |
| US-01 | Compromisso | _(preencher)_ | 5 pts | [PDF](docs/user-stories/US-01_Gestao_de_Contas_e_Perfis.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/g4Ch) | ☐ |
| US-02 | Compromisso | _(preencher)_ | 3 pts | [PDF](docs/user-stories/US-02_Autenticacao_e_Controle_de_Sessao.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/NYKh) | ☐ |
| US-03 | Compromisso | _(preencher)_ | 5 pts | [PDF](docs/user-stories/US-03_Cadastro_de_Estacoes.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/egCD) | ☐ |
| US-04 | Compromisso | _(preencher)_ | 8 pts | [PDF](docs/user-stories/US-04_Monitoramento_de_Disponibilidade.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/RIKh) | ☐ |
| US-05 | Compromisso | _(preencher)_ | 5 pts | [PDF](docs/user-stories/US-05_Parametrizacao_e_Calibracao_de_Sensores.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/UYKh) | ☐ |
| US-06 | Compromisso | _(preencher)_ | 8 pts | [PDF](docs/user-stories/US-06_Regras_e_Limiares_de_Alerta.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/XoKh) | ☐ |
| US-07 | Compromisso | _(preencher)_ | 3 pts\* | [PDF](docs/user-stories/US-07_Documentacao_e_Rastreabilidade.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/AYCZAQ) | ☐ |
| US-08 | Compromisso | _(preencher)_ | 3 pts\* | [PDF](docs/user-stories/US-08_Estruturacao_de_Repositorios.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/A4CWAQ) | ☐ |
| US-09 | Compromisso | _(preencher)_ | 3 pts\* | [PDF](docs/user-stories/US-09_Observabilidade_e_QA.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/DICWAQ) | ☐ |
| US-10 | Compromisso | _(preencher)_ | 3 pts\* | [PDF](docs/user-stories/US-10_Estrategia_de_Testes.pdf) · [Confluence](https://elementares-4sem.atlassian.net/wiki/x/DoCaAQ) | ☐ |

> O **PDF** é a versão condensada em linguagem de negócio (Regra 1.1), pensada para avaliação externa. O **Confluence** é o documento técnico vivo, com Regras de Negócio e Critérios de Aceitação detalhados, atualizado pelo squad no dia a dia.

> As caixas de **DoR Verificado** são marcadas pelo responsável ao mover o card para "Em Andamento" no Jira, conforme o checklist da seção [Critérios de Aceite](#dor-dod) abaixo — refletem o estado real da Sprint, não uma declaração antecipada.

> Este recorte reflete o compromisso da **Sprint 1**. US-07 a US-10 não se encerram aqui: o Sprint Backlog das Sprints 2 e 3 deve repeti-las como item de manutenção/verificação contínua, não como entrega nova.

### 🔍 Itens de Pesquisa e Débito Técnico (Spikes e Bugs)

Itens concretos identificados durante o planejamento técnico, registrados aqui para não ficarem apenas mencionados em texto:

| Código | Tipo | Item | Épico | Ticket |
| :----: | :--: | ---- | ----- | :----: |
| SPIKE-01 | Spike | Viabilidade de um simulador de estações IoT, para testar o pipeline de ingestão sem depender de hardware físico. | EPIC-04 | _a criar_ |
| SPIKE-02 | Spike | Definição do payload de telemetria (grandezas enviadas) e do intervalo de envio das estações. | EPIC-04 | _a criar_ |
| TECH-DEBT-01 | Item Técnico | Unificação de nomenclatura de schema entre a documentação de arquitetura e as especificações de User Story. | EPIC-04 | _a criar_ |
| — | Bug | Nenhum bug identificado até o momento — esperado nesta fase, sem código em produção ainda. Quando surgir, será registrado nesta mesma tabela. | — | — |

> Os itens com ticket "a criar" ainda precisam ser abertos formalmente no Jira antes da próxima revisão — esta tabela documenta a existência deles, mas a rastreabilidade completa depende do ticket real.

### 🏃 Sprint Backlog — Sprint 2 (Prévia)

As Sprints 2 e 3 ainda não começaram (períodos no [cronograma](#cronograma)), então este recorte é uma **prévia de planejamento**, não um compromisso operacional como o da Sprint 1 — não tem Responsável nem DoR verificado ainda, porque a Sprint Planning de verdade só acontece quando a Sprint 1 fechar.

| Capacidade estimada pela equipe por Sprint | A confirmar (Planning Poker da Sprint 2 ainda não realizado) |
| ------------------------------------------- | :--------------------------------------------: |
| **Meta da Sprint** | US-11 a US-14 — pipeline de ingestão real de ponta a ponta, dashboards, relatórios e análise estatística, conforme resposta do cliente ao levantamento de requisitos ("recepção de dados de ponta a ponta + alertas e alarmes") |
| **Previsão da Sprint (extras, sem compromisso de entrega)** | Nenhuma definida ainda — depende da velocidade real observada ao final da Sprint 1 |

| Rank | Prioridade | User Story | Estimativa\*\* | Sprint |
| :--: | :--------: | ----------- | :--------: | :----: |
| 07 | Alta | Como Gestor Público Municipal, quero que os dados enviados pelas estações sejam recebidos, calibrados e avaliados automaticamente de ponta a ponta, disparando alerta quando necessário, para que o monitoramento funcione de forma contínua e confiável, sem depender de simulação manual. | 13 | 2 |
| 08 | Alta | Como Gestor Público Municipal, quero visualizar dashboards com a série histórica de qualidade do ar e o status das estações, para acompanhar tendências e tomar decisões com base em dados consolidados. | 8 | 2 |
| 09 | Alta | Como Gestor Público Municipal, quero gerar relatórios em formato exportável (PDF/CSV) com os dados coletados, para auditar medições ambientais históricas do município. | 8 | 2 |
| 10 | Alta | Como Pesquisador, quero aplicar análises estatísticas sobre as séries históricas de qualidade do ar, para investigar a relação entre condições ambientais e a demanda por atendimentos respiratórios. | 13 | 2 |

> \*\*Estimativas preliminares do PO, a validar em Planning Poker no início da Sprint 2 — ver nota da tabela de Backlog do Produto acima.

---

### 📋 Requisitos do Sistema

> Os códigos RF/RNF seguem a numeração oficial definida com o cliente. As descrições abaixo foram detalhadas para refletir como cada requisito se manifesta especificamente na solução Pulso Urbano — não são texto genérico de briefing.

**Requisitos Funcionais (RF):**

* **RF-01 — Modelo de Dados Dinâmico:** o cadastro de sensores aceita qualquer grandeza (temperatura, umidade, PM2.5, vento, pressão) através do campo `grandeza` na tabela `sensores`, sem exigir alteração de schema para adicionar um novo tipo de sensor.
* **RF-02 — CRUD de Estações, Parâmetros, Alertas e Usuários:** criação, listagem, edição e inativação lógica (nunca exclusão física) de estações, sensores, regras de alerta, contas e papéis — preservando o histórico de medições vinculado.
* **RF-03 — Recepção de Dados:** ingestão via protocolo MQTT, com gravação imediata em banco temporário e processamento assíncrono via RabbitMQ, garantindo que uma falha no processamento não descarte a leitura de campo.
* **RF-04 — Dashboards:** painéis exibindo a classificação de qualidade do ar (IQAr) em tempo real e o status de disponibilidade de cada estação (Ativa / Com Falha / Inativa), sempre isolados por município.
* **RF-05 — Geração de Alertas:** disparo automático de evento quando uma leitura calibrada viola o limiar de uma regra ativa, publicado no RabbitMQ e consumido pelo `alertas-notificacoes` — sem depender de consulta periódica ao banco.
* **RF-06 — Datalogger:** módulo embarcado na estação física (Sprint 3) responsável por registrar as leituras brutas dos sensores antes do envio via MQTT.
* **RF-07 — Estação Meteorológica:** construção física da estação de baixo custo com sensores de temperatura, umidade, PM2.5, vento e pressão, integrada ao datalogger.
* **RF-08 — Controle de Acesso:** autenticação via JWT com três perfis (Administrador, Gestor Público, Pesquisador) e isolamento territorial — um Gestor Público só acessa dados do seu próprio município.
* **RF-09 — Relatórios:** exportação em PDF/CSV do histórico de medições e alarmes de um município, para auditoria pela Secretaria de Saúde.
* **RF-10 — Análise Estatística:** correlação entre a série histórica de qualidade do ar e o histórico de atendimentos respiratórios (importado do SIVEP-Gripe/SIH-SUS), para identificar padrões sazonais.

**Requisitos Não Funcionais (RNF):**

* **RNF-01 — Experiência do Usuário (UX):** interface com Dark Mode exibindo badges de severidade (Informativo/Alerta/Crítico) e status de estação de forma visualmente imediata, sem exigir leitura de texto para identificar risco.
* **RNF-02 — Documentação de APIs:** rotas documentadas com exemplo de requisição e resposta, priorizadas conforme o cliente definiu: manual de instalação, rotas da API, modelo de dados, arquitetura e manual do usuário, nesta ordem.
* **RNF-03 — Integração Contínua (CI):** esteira no GitHub Actions com validação de tipos TypeScript, lint e suíte de testes, bloqueando merge em caso de falha — branches `main` e `develop` protegidas por *ruleset*.
* **RNF-04 — Deploy Automatizado (CD):** entrega contínua para homologação e produção, acionada após aprovação de Pull Request.
* **RNF-05 — Robustez e Escalabilidade:** suporte a picos de acesso simultâneo, especialmente no momento em que um alerta crítico é disparado — quando a consulta ao Portal Público tende a aumentar repentinamente. A recepção de dados (ingestão) é a função mais crítica do sistema: uma falha no dashboard é reversível consultando depois, uma falha na ingestão perde a leitura daquele período para sempre.

---

### 📐 Variáveis Monitoradas

O escopo de sensores do MVP foi definido a partir da dor do cliente: cada variável coletada existe porque ajuda a caracterizar as condições ambientais associadas à demanda por atendimentos respiratórios.

| Variável | Unidade | Por que está no escopo |
| -------- | :-----: | ---------------------- |
| Temperatura | °C | Variável mais diretamente observável para identificar diferenças térmicas entre regiões (ilhas de calor). |
| Umidade Relativa | % | Interfere nas trocas de energia e caracteriza condições de baixa umidade associadas a quadros respiratórios. |
| PM2.5 | µg/m³ | Partícula fina, associada a doenças respiratórias por penetrar profundamente no sistema respiratório. |
| Velocidade do Vento | km/h | Determina o transporte e a dispersão dos poluentes a partir da fonte. |
| Direção do Vento | ° | Indica de onde vem o poluente e quais áreas tendem a ser afetadas. |
| Precipitação | mm | Influencia a remoção de material particulado suspenso na atmosfera. |
| Pressão Atmosférica | hPa | Condiciona a estagnação ou dispersão do ar próximo à superfície. |

> **Fora do escopo do MVP:** PM10, O₃, NO₂, CO₂, radiação solar/UV, variáveis de solo e de nuvens. São variáveis válidas em meteorologia, mas não contribuem diretamente para a análise proposta nesta fase.

---

### 🎯 Critérios de Aceite (DoR e DoD) <a id="dor-dod"></a>

**Definition of Ready (DoR):**

* User Story escrita no padrão ágil (**Como / Quero / Para**).
* Critérios de aceitação definidos no formato BDD (**Dado / Quando / Então**).
* Requisitos Funcionais e Não Funcionais associados e mapeados no Confluence.
* Dicionário de dados da entidade validado com tipos SQL e TypeScript.
* Sem dependências bloqueadoras para o início do desenvolvimento.

**Definition of Done (DoD):**

* Código implementado segundo os padrões arquiteturais do repositório.
* Subtarefas do Jira finalizadas e horas de esforço apontadas no card pai.
* Cobertura de testes unitários/integração validando os cenários da história.
* Pull Request revisado e aprovado por pelo menos um membro do Dev Team (**peer review**).
* Documentação de API atualizada e rastreabilidade amarrada no Jira e Confluence.
* Entrega homologada formalmente pelo Product Owner na coluna **Validação PO**.

---

## ⚙️ Engenharia e DevOps <a id="engenharia"></a>

As práticas técnicas da equipe Elementares unem o desenvolvimento de software (Dev) à infraestrutura e qualidade (Ops) com transparência, visando entregas incrementais e rastreáveis.

### 📐 Arquitetura

A plataforma adota uma arquitetura de **microsserviços**, com ingestão desacoplada em três camadas: as estações publicam telemetria bruta via **MQTT**, o serviço de ingestão grava o payload em um **banco temporário** e publica o evento no **RabbitMQ**, e o serviço de validação consome a fila, aplica a calibração e persiste o dado tratado no PostgreSQL.

Esse desacoplamento garante que uma falha no processamento nunca interrompa a coleta em campo: o dado bruto fica preservado e pode ser reprocessado.

![Diagrama da Arquitetura de Microsserviços do Pulso Urbano](docs/arquitetura/diagrama_arquitetura.png)

> Diagrama completo, com o racional de cada decisão, está em [Proposta de Arquitetura Final](docs/arquitetura/Proposta_Arquitetura_Final.pdf) e no histórico de decisão em [ADR-001](docs/arquitetura/ADR-001_Arquitetura_Microsservicos_MQTT_RabbitMQ.pdf).

| Microsserviço | Responsabilidade |
| ------------- | ---------------- |
| `auth-service` | Autenticação e emissão de token de sessão. |
| `gestao-usuarios` | CRUD de contas, papéis e vínculo municipal. |
| `gestao-estacoes` | CRUD de estações, sensores e regras de alerta. |
| `ingestao-dados` | Recepção da telemetria via MQTT e escrita no banco temporário. |
| `servico-validacao` | Limpeza, calibração (Fator/Ganho) e avaliação de regras de alerta. |
| `analise-dados` | Consultas agregadas para dashboards e relatórios. |
| `alertas-notificacoes` | Disparo de avisos quando um limiar é violado. |
| `servico-relatorios` | Geração assíncrona de arquivos de exportação. |

**Stack técnica:**

* **Backend:** Node.js com TypeScript e Express, estruturado em camadas (Controllers, Services, Repositories, Middlewares).
* **Frontend:** SPA em React (Vite) com TypeScript, estilizado com Tailwind CSS e DaisyUI.
* **Banco de Dados:** PostgreSQL acessado diretamente via biblioteca cliente `pg`, com integridade referencial estrita, índices analíticos e exclusão lógica (*soft delete*).
* **Mensageria:** MQTT na borda (dispositivos) e RabbitMQ na comunicação entre microsserviços, com Dead Letter Queue para tratamento de falhas.
* **Segurança:** Autenticação stateless via Token JWT (HMAC-SHA256) e senhas criptografadas com `bcryptjs` (salt rounds 10).

### 🗄️ Modelo de Dados

![Diagrama Entidade-Relacionamento do PostgreSQL](docs/banco-de-dados/modelo_er.png)

Script completo, idempotente, com as 9 tabelas, índices, triggers e rotinas de manutenção: [`modelo_completo_postgres.sql`](docs/banco-de-dados/modelo_completo_postgres.sql).

### 🚀 Pipeline de Entrega (CI/CD)

1. **Planejamento:** PO e Dev Team refinam requisitos no Confluence e organizam tarefas no Jira.
2. **Desenvolvimento:** Criação de branches a partir da `develop`, associadas ao ticket.
3. **Qualidade e CI:** GitHub Actions executa validação de tipos TypeScript, lint e testes automatizados a cada Pull Request.
4. **Code Review:** Pull Requests exigem aprovação de pelo menos um par antes do merge.
5. **Deploy:** Entrega contínua para homologação e produção após aprovação.

### 🔀 Padrão de Versionamento e Commits

A rastreabilidade entre o código no GitHub e os cartões do Jira é mandatória.

**Fluxo de trabalho:** `feature/*` → `develop` → `main`

Os repositórios estão configurados para aceitar **exclusivamente squash merge**, e a mensagem do commit é gerada a partir do **título do Pull Request**. Por isso, o título do PR deve seguir o padrão do squad — é ele que chega na `develop`.

```bash
# Formato do título do PR e do commit:
ELEM-XX tipo: Título resumido da alteração

# Exemplo de feature:
git commit -m "ELEM-6 feat: Implementado endpoint de listagem de usuarios" -m "Criada rota GET /usuarios com suporte a paginacao e filtro de status ativo."

# Exceções de documentação e manutenção (sem ticket vinculado):
git commit -m "docs: Atualizado README com o Backlog do Produto da Sprint 1"
git commit -m "chore: Ajustada configuracao de dependencias do package.json"
```

**Tipos aceitos:** `feat`, `fix`, `docs`, `test`, `refactor`, `chore`, `style`.

**Nomenclatura de branches:**

| Tipo | Padrão |
| ---- | ------ |
| Funcionalidade | `feat/ELEM-XX-nome-da-funcionalidade` |
| Correção | `fix/ELEM-XX-descricao-do-ajuste` |
| Documentação | `docs/ELEM-XX-atualizacao-documento` |

### 🛡️ Governança do Repositório

As branches `main` e `develop` são protegidas por *ruleset*, exigindo:

* Pull Request aprovado por pelo menos um revisor antes do merge;
* Aprovação nos checks automatizados da esteira de CI;
* Bloqueio de *force push* e de deleção de branch.

---

## 🛡️ Testes e Qualidade <a id="qualidade"></a>

A estratégia de garantia de qualidade contempla:

* **Testes de Unidade:** Validação da lógica de negócio crítica — conversão de leituras (equação afim), avaliação de regras de alerta e validação de dados de entrada.
* **Testes de Integração:** Validação da comunicação entre a API e o banco de dados em ambiente controlado por containers.
* **Testes de API:** Validação de contratos HTTP, status codes (200, 201, 400, 401, 403, 409) e payloads.
* **Rastreabilidade de Testes:** Cada User Story possui uma tarefa de teste consolidada no Jira contendo o checklist de casos executados.
* **Execução Automatizada:** A suíte é executada a cada Pull Request e bloqueia o merge em caso de falha.

---

## 📅 Cronograma de Entregas <a id="cronograma"></a>

| Sprint | Período | Objetivo Principal | Status |
| ------ | ------- | ------------------ | ------ |
| **Sprint 1** | 07/09 a 27/09 | **MVP 1:** Governança de Usuários, Autenticação, Gestão de Estações, Monitoramento de Conectividade e Regras de Alerta. | ⏳ Em andamento |
| **Sprint 2** | 05/10 a 25/10 | **MVP 2:** Ingestão contínua de telemetria, Dashboards analíticos, Módulo de Relatórios e Análise Estatística. | ⏳ Planejado |
| **Sprint 3** | 02/11 a 22/11 | **MVP 3:** Portal público de Dados Abertos, Otimizações de performance, Datalogger integrado e Alertas em tempo real. | ⏳ Planejado |

---

## 💻 Guias e Manuais <a id="manuais"></a>

### Pré-requisitos

* Node.js (v18 ou superior)
* Docker e Docker Compose
* Git instalado e configurado

### Execução Local (Setup Rápido)

```bash
# 1. Clonar o repositório
git clone https://github.com/ELEMENTARES-DSM/BACKEND-4SEMESTRE.git

# 2. Acessar a pasta
cd BACKEND-4SEMESTRE

# 3. Configurar variáveis de ambiente
cp .env.example .env

# 4. Subir os serviços de infraestrutura (PostgreSQL, MQTT Broker e RabbitMQ)
docker compose up -d

# 5. Instalar dependências
npm install

# 6. Executar as migrações do banco de dados
npm run migrate

# 7. Iniciar em modo de desenvolvimento
npm run dev
```

> O projeto também disponibiliza configuração de **DevContainer**, permitindo abrir o ambiente já padronizado diretamente no VS Code, sem configuração manual.

---

## 🛠️ Tecnologias <a id="tecnologias"></a>

| Camada | Tecnologias |
| ------ | ----------- |
| **Frontend** | React · Vite · TypeScript · Tailwind CSS · DaisyUI |
| **Backend** | Node.js · TypeScript · Express · biblioteca `pg` |
| **Banco de Dados** | PostgreSQL |
| **Mensageria** | MQTT · RabbitMQ |
| **Infraestrutura** | Docker · Docker Compose · DevContainers |
| **CI/CD** | GitHub Actions · GitHub Rulesets |
| **Gestão** | Jira · Confluence |

---

## 🤝 Nossa Equipe <a id="equipe"></a>

| Nome | Função | Redes Sociais |
| :--- | :--- | :--- |
| **João Moura** | Scrum Master | <a href="https://github.com/JoaooMoura"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/joaoomoura/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Lucas Inácio** | **Product Owner (PO)** | <a href="https://github.com/Lukitta013"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/luucasinacioo/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **João Vitor Siqueira** | Dev Team | <a href="https://github.com/kakashinho"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/joao-vitor-siqueira-a2a2a3227/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Enzo Gabriel de Paula** | Dev Team | <a href="https://github.com/EnzoGabrielCode"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/enzo-gabriel-de-paula-8795a8332/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Ana Graciano** | Dev Team | <a href="https://github.com/Ane-Graciano"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/ana-graciano/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Gustavo Rosa** | Dev Team | <a href="https://github.com/gustasvos"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/gustavo-rosa-46a251180/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Laís Zanardi** | Dev Team | <a href="https://github.com/lais-zanardi"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/lais-zanardi-inocencio/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Pedro Nascimento** | Dev Team | <a href="https://github.com/P3dr0213"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/pedro-nascimento-87a22937a/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |