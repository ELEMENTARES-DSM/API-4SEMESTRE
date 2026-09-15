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
> **Board (Jira):** [Acessar Gerenciador de Tarefas](https://elementares-4sem.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog)
> **Repositórios:** [Backend](https://github.com/ELEMENTARES-DSM/BACKEND-4SEMESTRE) · [Frontend](https://github.com/ELEMENTARES-DSM/FRONTEND-4SEMESTRE)

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

O **Pulso Urbano** é uma rede de estações ambientais de baixo custo que coleta continuamente variáveis como temperatura, umidade e PM2.5. A plataforma centraliza, armazena e disponibiliza esses dados em séries históricas, permitindo que as Secretarias de Saúde tenham uma base ambiental estruturada para posteriormente cruzá-la com seus próprios registros de atendimento e analisar possíveis relações entre as condições ambientais e a demanda por atendimentos respiratórios.

A partir dessa base histórica, a Secretaria poderá identificar padrões e utilizar essas informações como apoio ao planejamento e à preparação da rede de saúde.

---

## 📌 Produto <a id="backlog"></a>

### 📋 Backlog do Produto

O backlog segue a classificação de itens definida pelo cliente: **User Stories** (valor direto ao usuário) e **Itens Técnicos / Infraestrutura** (engenharia habilitadora) convivem na mesma numeração sequencial, cada um com seu ticket rastreável no Jira.

| US | Tipo | História | Épico | Ticket | Requisitos | Pontos | Sprint |
| :--: | :--: | -------- | ----- | :----: | :--------: | :----: | :----: |
| **US-01** | Negócio | Como administrador, quero gerenciar contas e papéis hierárquicos para controlar o acesso de gestores e pesquisadores na plataforma. | EPIC-01 | ELEM-6 | RF-02, RF-08 | 5 | 1 |
| **US-02** | Negócio | Como usuário cadastrado, quero me autenticar com credenciais corporativas e sessão segura para acessar as áreas e dados restritos ao meu perfil. | EPIC-01 | ELEM-11 | RF-08 | 3 | 1 |
| **US-03** | Negócio | Como gestor público, quero cadastrar e gerenciar estações meteorológicas georreferenciadas para manter o inventário territorial sob governança municipal. | EPIC-02 | ELEM-16 | RF-01, RF-02 | 5 | 1 |
| **US-04** | Negócio | Como gestor público, quero monitorar a conectividade e disponibilidade das estações para identificar quedas de sinal e falhas operacionais. | EPIC-03 | ELEM-23 | RF-03 | 8 | 1 |
| **US-05** | Negócio | Como gestor público, quero parametrizar e calibrar os sensores associados às estações para que as leituras brutas sejam convertidas em grandezas reais. | EPIC-02 | ELEM-27 | RF-01, RF-02 | 5 | 1 |
| **US-06** | Negócio | Como técnico da Defesa Civil, quero configurar regras de alerta e limiares críticos para disparar avisos preventivos em condições ambientais severas. | EPIC-03 | ELEM-32 | RF-02, RF-05 | 8 | 1 |
| **US-07** | Técnico | Documentação e Rastreabilidade do Projeto. | EPIC-04 | ELEM-58 | RNF-02 | — | 1 |
| **US-08** | Técnico | Estruturação de Repositórios e Arquitetura de Código. | EPIC-04 | ELEM-59 | RNF-03 | — | 1 |
| **US-09** | Técnico | Observabilidade e Processos de QA. | EPIC-04 | ELEM-60 | RNF-05 | — | 1 |
| **US-10** | Técnico | Estratégia de Testes (Unitários e Integração). | EPIC-04 | ELEM-61 | RNF-03 | — | 1 |

> **Carga estimada da Sprint 1:** 34 Story Points nas histórias de negócio (US-01 a US-06), consenso de Planning Poker. Itens técnicos (US-07 a US-10) são medidos por horas apontadas no card, não por Story Points, conforme a Definition of Done do squad.

**Épicos:** `EPIC-01` Gestão de Acessos e Perfis de Usuários · `EPIC-02` Inventário Territorial de Estações e Sensores · `EPIC-03` Monitoramento Operacional e Gestão de Alertas · `EPIC-04` Engenharia de Plataforma, DevOps e Qualidade (Técnico).

### 🗓️ Backlog Futuro (Sprints 2 e 3)

Os itens abaixo já têm objetivo definido no cronograma, mas ainda **não foram numerados nem criados no Jira** — a numeração `US-11` em diante será definida na Sprint Planning correspondente, para não colidir com os itens técnicos já registrados como US-07 a US-10.

| Prioridade | História (rascunho) | Requisitos | Sprint |
| :--------: | -------------------- | :--------: | :----: |
| Média | Como gestor público, quero emitir relatórios analíticos dos dados coletados para auditar medições ambientais históricas do município. | RF-09 | 2 |
| Média | Como pesquisador, quero aplicar análises estatísticas sobre as séries históricas para investigar a relação entre condições ambientais e demanda por atendimentos. | RF-10 | 2 |
| Baixa | Como munícipe, quero consultar um painel público de dados abertos para acompanhar os índices ambientais do meu município. | RF-04 | 3 |

### 📦 Demais Tipos de Item do Backlog

Além de User Stories (negócio e técnicas), o backlog contempla **Spikes** (itens de pesquisa e prototipação, quando o time ainda não sabe como resolver um problema) e **Bugs** (correções de defeitos identificados), ambos com numeração e apontamento de horas próprios, fora da sequência US-XX.

---

### 📋 Requisitos do Sistema

**Requisitos Funcionais (RF):**

* **RF-01 — Modelo de Dados Dinâmico:** Capacidade de receber e registrar estações meteorológicas equipadas com diversos tipos de sensores.
* **RF-02 — CRUD de Estações, Parâmetros, Alertas e Usuários:** Funcionalidades completas de criação, leitura, atualização e exclusão dessas entidades.
* **RF-03 — Recepção de Dados:** Processamento e armazenamento dos dados enviados pelas estações meteorológicas.
* **RF-04 — Dashboards:** Visualização interativa dos parâmetros meteorológicos em painéis dedicados.
* **RF-05 — Geração de Alertas:** Criação automática de notificações com base em condições meteorológicas específicas.
* **RF-06 — Datalogger:** Implementação de módulo de datalogger para registrar medições em campo.
* **RF-07 — Estação Meteorológica:** Construção física de uma estação com sensores e componentes necessários.
* **RF-08 — Controle de Acesso:** Sistema de autenticação com múltiplos níveis de perfil (Administrador, Gestor Público e Pesquisador).
* **RF-09 — Relatórios:** Emissão de relatórios analíticos em múltiplos formatos sobre as medições coletadas.
* **RF-10 — Análise Estatística:** Aplicação de conceitos estatísticos consolidados aos dashboards e relatórios.

**Requisitos Não Funcionais (RNF):**

* **RNF-01 — Experiência do Usuário (UX):** Interface moderna com Dark Mode, foco em acessibilidade e alta usabilidade visual.
* **RNF-02 — Documentação de APIs:** Mapeamento técnico detalhado de todas as rotas da API com exemplos de requisição e resposta.
* **RNF-03 — Integração Contínua (CI):** Esteira automatizada de build, linting e suíte de testes de regressão no GitHub Actions.
* **RNF-04 — Deploy Automatizado (CD):** Entrega contínua configurada para ambiente de homologação e produção.
* **RNF-05 — Robustez e Escalabilidade:** Suporte a volume concorrente de requisições por minuto compatível com as comarcas atendidas.

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

### 🎯 Critérios de Aceite (DoR e DoD)

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