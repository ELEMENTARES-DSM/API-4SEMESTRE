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

> ****Fase Atual:**** Sprint 1 — Fundação, Governança e Ativos IoT 🚀  

> ****Board (Jira):**** [Acessar Gerenciador de Tarefas](https://elementares-4sem.atlassian.net/jira/software/projects/SCRUM/boards/1/backlog)  

> ****Repositório:**** [Elementares / API-4Semestre](https://github.com/)

---

## 🎯 Visão Geral <a id="sobre"></a>

### 🏢 Parceiro de Negócio (Cliente)

****Diogo Branquinho**** (Representando a empresa ****TECSUS****).

A [Tecsus](https://www.tecsus.com.br/) é uma empresa de tecnologia especializada em soluções inteligentes para o controle e gestão de utilidades (água, energia e gás) em empresas com múltiplas unidades. Com mais de 10 anos de mercado, a Tecsus atua ajudando negócios a obter visibilidade sobre seus consumos, reduzir desperdícios e automatizar processos operacionais com eficiência e inovação. Seu foco está muito alinhado com as práticas de ESG (Ambiental, Social e Governança), buscando sempre uma gestão sustentável e inteligente.

### ⚠️ A Dor

Dificuldade dos municípios, consórcios intermunicipais e órgãos de proteção civil em monitorar de forma centralizada e em tempo real as variáveis climáticas locais, gerenciar o ciclo de manutenção de equipamentos IoT espalhados em campo e antecipar situações de risco por falta de parametrização dinâmica de alertas.

### 🚀 Desafio

Construir uma plataforma digital integrada para captura, processamento, governança e disponibilização de dados meteorológicos coletados por estações físicas, assegurando isolamento territorial entre municípios, alta disponibilidade de rede e controle rigoroso de acesso hierárquico.

### ✨ A Solução

Desenvolvimento de uma aplicação web responsiva aliada a uma API REST modular e resiliente que realiza o inventário georreferenciado de estações e sensores, supervisiona o status de comunicação dos ativos em campo por tempo decorrido de telemetria, autentica usuários com perfis restritos via JWT e permite a configuração de gatilhos automáticos para eventos climáticos críticos.

---

## 📌 Produto <a id="backlog"></a>

### 📋 Backlog do Produto

| Rank | Prioridade | User Stories | Estimativa (Pontos) | Sprint |
| :--: | :--------: | ------------ | :-----------------: | :----: |
| 01 | Alta | [US-01] Como administrador, quero gerenciar contas e papéis hierárquicos para controlar o acesso de gestores e pesquisadores na plataforma. | 5 | 1 |
| 02 | Alta | [US-02] Como usuário cadastrado, quero me autenticar com credenciais corporativas e token seguro para acessar as áreas e dados restritos ao meu perfil. | 5 | 1 |
| 03 | Alta | [US-03] Como gestor público, quero cadastrar e gerenciar estações meteorológicas georreferenciadas para manter o inventário territorial sob governança municipal. | 5 | 1 |
| 04 | Alta | [US-04] Como gestor público, quero monitorar a conectividade e disponibilidade das estações em tempo real para identificar quedas de sinal e falhas operacionais. | 8 | 1 |
| 05 | Média | [US-05] Como gestor público, quero parametrizar sensores meteorológicos associados às estações para padronizar grandezas e unidades de medição IoT. | 5 | 1 |
| 06 | Média | [US-06] Como técnico da Defesa Civil, quero configurar regras de alerta e limiares críticos para disparar avisos preventivos em condições climáticas severas. | 5 | 1 |
| 07 | Média | [US-07] Como gestor público, quero emitir relatórios analíticos dos dados coletados para auditar medições climáticas históricas do município. | 8 | 2 |
| 08 | Média | [US-08] Como pesquisador, quero aplicar análises estatísticas sobre as telemetrias para identificar correlações térmicas e pluviométricas urbanas. | 8 | 2 |
| 09 | Baixa | [US-09] Como munícipe, quero consultar um painel público de dados abertos para acompanhar os índices ambientais e alertas em tempo real. | 5 | 3 |

---

### 📋 Requisitos do Sistema

****Requisitos Funcionais (RF):****

* ****RF-01 — Modelo de Dados Dinâmico:**** Capacidade de receber e registrar estações meteorológicas equipadas com diversos tipos de sensores.

* ****RF-02 — CRUD de Estações, Parâmetros, Alertas e Usuários:**** Funcionalidades completas de criação, leitura, atualização e exclusão dessas entidades.

* ****RF-03 — Recepção de Dados:**** Processamento e armazenamento dos dados enviados pelas estações meteorológicas.

* ****RF-04 — Dashboards:**** Visualização interativa dos parâmetros meteorológicos em painéis dedicados.

* ****RF-05 — Geração de Alertas:**** Criação automática de notificações com base em condições meteorológicas específicas.

* ****RF-06 — Datalogger:**** Implementação de módulo de datalogger para registrar medições em campo.

* ****RF-07 — Estação Meteorológica:**** Construção física de uma estação com sensores e componentes necessários.

* ****RF-08 — Controle de Acesso:**** Sistema de autenticação com múltiplos níveis de perfil (Administrador, Gestor Público e Pesquisador).

* ****RF-09 — Relatórios:**** Emissão de relatórios analíticos em múltiplos formatos sobre as medições coletadas.

* ****RF-10 — Análise Estatística:**** Aplicação de conceitos estatísticos consolidados aos dashboards e relatórios.

****Requisitos Não Funcionais (RNF):****

* ****RNF-01 — Experiência do Usuário (UX):**** Interface moderna com Dark Mode, foco em acessibilidade e alta usabilidade visual.

* ****RNF-02 — Documentação de APIs:**** Mapeamento técnico detalhado de todas as rotas da API com exemplos de requisição e resposta.

* ****RNF-03 — Integração Contínua (CI):**** Esteira automatizada de build, linting e suíte de testes de regressão no GitHub Actions.

* ****RNF-04 — Deploy Automatizado (CD):**** Entrega contínua configurada para ambiente de homologação e produção.

* ****RNF-05 — Robustez e Escalabilidade:**** Suporte a volume concorrente de requisições por minuto compatível com as comarcas atendidas.

---

### 🎯 Critérios de Aceite (DoR e DoD)

****Definition of Ready (DoR):****

* User Story escrita no padrão ágil (**Como / Quero / Para**).

* Critérios de aceitação definidos no formato BDD (**Dado / Quando / Então**).

* Requisitos Funcionais e Não Funcionais associados e mapeados no Confluence.

* Dicionário de dados da entidade validado com tipos SQL e TypeScript.

* Dependências e regras de negócio resolvidas antes do início da Sprint.

****Definition of Done (DoD):****

* Código implementado segundo os padrões arquiteturais do repositório.

* Subtarefas do Jira finalizadas e apontadas no card pai.

* Cobertura de testes unitários/integração validando os cenários da história.

* Pull Request revisado e aprovado por pelo menos um membro do Dev Team (**peer review**).

* Documentação de API atualizada e rastreabilidade amarrada no Jira e Confluence.

---

## ⚙️ Engenharia e DevOps <a id="engenharia"></a>

As práticas técnicas da equipe Elementares unem o desenvolvimento de software (Dev) à infraestrutura e qualidade (Ops) com transparência, visando entregas incrementais e rastreáveis.

### 📐 Arquitetura

* ****Backend:**** Node.js com TypeScript estruturado em camadas (Controllers, Services, Repositories, Middlewares).

* ****Frontend:**** Single Page Application (SPA) em React com TypeScript, estilizado com Tailwind CSS e DaisyUI.

* ****Banco de Dados:**** PostgreSQL com integridade referencial estrita, índices analíticos e suporte a exclusão lógica (**soft delete**).

* ****Segurança:**** Autenticação stateless via Token JWT (HMAC-SHA256) e senhas criptografadas com `bcryptjs` (salt rounds 10).

### 🚀 Pipeline de Entrega (CI/CD)

1. ****Planejamento:**** PO e Dev Team refinam requisitos no Confluence e organizam tarefas no Jira.

2. ****Desenvolvimento:**** Criação de branches a partir da `develop` associadas ao ticket (ex.: `feature/ELEM-6-usuarios`).

3. ****Qualidade e CI:**** GitHub Actions executa validação de tipos TypeScript, lint e testes automatizados a cada push.

4. ****Code Review:**** Pull Requests exigem aprovação de pares antes do merge na branch principal.

5. ****Deploy:**** Deploy contínuo automatizado do ambiente após aprovação de homologação.

### 🔀 Padrão de Versionamento e Commits

Para assegurar a rastreabilidade entre o código e o planejamento no Jira, os commits e Pull Requests devem seguir a convenção definida pelo squad:

```bash

*# Formato Geral:*

git commit -m "[CHAVE-JIRA] tipo: Título resumido da alteração" -m "Descrição com detalhamento sobre o que modificou e para qual finalidade."

*# Exemplo de Feature:*

git commit -m "[ELEM-6] feat: Implementado endpoint de listagem de usuarios" -m "Criada rota GET /usuarios com suporte a paginacao e filtro de status ativo."

*# Exceções de Documentação e Manutenção:*

git commit -m "docs: Atualizado README com o Backlog do Produto da Sprint 1"

git commit -m "chore: Ajustada configuracao de dependencias do package.json"

```

---

## 🛡️ Testes e Qualidade

A estratégia de garantia de qualidade contempla:

* ****Testes de Unidade e Integração:**** Validação de regras de negócio, middlewares de autenticação e endpoints REST.

* ****Testes de API:**** Execução de suítes de validação de contratos HTTP, status codes (200, 201, 400, 401, 403, 409) e payloads.

* ****Rastreabilidade de Testes:**** Cada User Story possui uma tarefa de teste consolidada no Jira contendo o checklist de casos executados.

---

## 📅 Cronograma de Entregas

| Sprint             | Período      | Objetivo Principal                                                                                                                              | Status          |

| ------------------ | ------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | --------------- |

| ****Sprint 1**** | 07/09 a 27/09 | ****MVP 1:**** Governança de Usuários (RBAC), Autenticação JWT, Gestão de Estações, Monitoramento de Conectividade e Regras de Alerta. | ⏳ Em andamento |

| ****Sprint 2**** | 05/10 a 25/10 | ****MVP 2:**** Ingestão contínua de telemetria, Dashboards analíticos, Módulo de Relatórios e Análise Estatística.                     | ⏳ Planejado    |

| ****Sprint 3**** | 02/11 a 22/11 | ****MVP 3:**** Portal público de Dados Abertos, Otimizações de performance, Datalogger integrado e Alertas em tempo real.                  | ⏳ Planejado    |

---

## 💻 Guias e Manuais

### Pré-requisitos

* Node.js (v18 ou superior)

* PostgreSQL (v14 ou superior)

* Git instalado e configurado

### Execução Local (Setup Rápido)

```bash

*# 1. Clonar o repositório*

git clone [https://github.com/seu-organizacao/elementares-api.git](https://github.com/seu-organizacao/elementares-api.git)

*# 2. Acessar a pasta e instalar dependências*

cd elementares-api

npm install

*# 3. Configurar variáveis de ambiente*

cp .env.example .env

*# 4. Executar migrações do banco de dados*

npm run migrate

*# 5. Iniciar em modo de desenvolvimento*

npm run dev

```

---

## 🛠️ Tecnologias

---

## 🤝 Nossa Equipe

| Nome | Função | Redes Sociais |
| :--- | :--- | :--- |
| **João Moura** | Scrum Master | <a href="https://github.com/JoaooMoura"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/joaoomoura/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **João Vitor Siqueira** | Dev Team | <a href="https://github.com/kakashinho"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/joao-vitor-siqueira-a2a2a3227/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Enzo Gabriel de Paula** | Dev Team | <a href="https://github.com/EnzoGabrielCode"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/enzo-gabriel-de-paula-8795a8332/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Lucas Inácio** | **Product Owner (PO)** | <a href="https://github.com/Lukitta013"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/luucasinacioo/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Ana Graciano** | Dev Team | <a href="https://github.com/Ane-Graciano"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/ana-graciano/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Gustavo Rosa** | Dev Team | <a href="https://github.com/gustasvos"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/gustavo-rosa-46a251180/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Laís Zanardi** | Dev Team | <a href="https://github.com/lais-zanardi"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/lais-zanardi-inocencio/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |
| **Pedro Nascimento** | Dev Team | <a href="https://github.com/P3dr0213"><img src="https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white" alt="GitHub"></a> <a href="https://www.linkedin.com/in/pedro-nascimento-87a22937a/"><img src="https://img.shields.io/badge/LinkedIn-0A66C2?style=flat-square&logo=linkedin&logoColor=white" alt="LinkedIn"></a> |