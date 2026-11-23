# API DSM - 4º SEMESTRE 2026

<h2 align="center"> ELEMENTARES </h2>

<p align="center">
<b>🏠 Início</b> · <a href="docs/backlog.md">Backlog</a> · <a href="docs/sprints/sprint-1.md">Sprint 1</a> · <a href="docs/sprints/sprint-2.md">Sprint 2</a> · <a href="docs/sprints/sprint-3.md">Sprint 3</a> · <a href="docs/requisitos.md">Requisitos</a> · <a href="docs/arquitetura.md">Arquitetura</a> · <a href="docs/eventos.md">Eventos</a> · <a href="docs/processo.md">Processo</a> · <a href="docs/qualidade.md">Qualidade</a> · <a href="docs/instalacao.md">Instalação</a> · <a href="docs/Manual_do_Usuario_Pulso_Urbano.pdf">Manual do Usuário</a>
</p>

<p align="center">
  <a href="#sobre">Visão Geral</a> |
  <a href="#sprints">Sprints</a> |
  <a href="#backlog">Backlog</a> |
  <a href="#documentacao">Documentação</a> |
  <a href="#executar">Como executar</a> |
  <a href="#tecnologias">Tecnologias</a> |
  <a href="#equipe">Nossa Equipe</a>
</p>

> **Tema:** Smart Cities 🏙️
>
> **Fase Atual:** Sprint 3 — Estação física, API pública e entrega final ✅ Finalizada

### 🔗 Links Rápidos

| Recurso | Link |
| --- | :--: |
| 📋 Board do Produto (Jira) | [Acessar Backlog](https://elementares-4sem.atlassian.net/jira/software/projects/ELEM/boards/2/backlog) |
| 🖥️ Repositório Backend | [BACKEND-4SEMESTRE](https://github.com/ELEMENTARES-DSM/BACKEND-4SEMESTRE) |
| 🎨 Repositório Frontend | [FRONTEND-4SEMESTRE](https://github.com/ELEMENTARES-DSM/FRONTEND-4SEMESTRE) |
| 🏗️ Documento de Arquitetura | [`Arquitetura.pdf`](docs/Arquitetura.pdf) |
| 🗄️ Modelo de Dados | [`Modelo_de_Dados.pdf`](docs/Modelo_de_Dados.pdf) |
| 📘 Manual do Usuário | [`Manual_do_Usuario_Pulso_Urbano.pdf`](docs/Manual_do_Usuario_Pulso_Urbano.pdf) |
| 🎬 Sprints e demonstrações | [Ver seção Sprints](#sprints) |
| 📄 Documentação | [Ver seção Documentação](#documentacao) |
| 👥 GitHub e LinkedIn do time | [Ver seção Nossa Equipe](#equipe) |

---

## 🎯 Visão Geral <a id="sobre"></a>

### 🏢 Parceiro de Negócio (Cliente)

**Diogo Branquinho** (Representando a empresa **TECSUS**, em parceria com a **Prefeitura de São José dos Campos**).

A [Tecsus](https://www.tecsus.com.br/) é uma empresa de tecnologia especializada em soluções inteligentes para o controle e gestão de utilidades (água, energia e gás) em empresas com múltiplas unidades. Com mais de 10 anos de mercado, a Tecsus atua ajudando negócios a obter visibilidade sobre seus consumos, reduzir desperdícios e automatizar processos operacionais com eficiência e inovação, alinhada às práticas de ESG (Ambiental, Social e Governança).

### ⚠️ A Dor

Municípios como **São José dos Campos** dependem hoje da rede estadual da CETESB, que possui poucos pontos de medição na cidade (como Jardim Satélite e Vista Verde) e não é operada pelo município. Sem uma rede própria, acessível e contínua de monitoramento ambiental, gestores públicos ficam sem histórico confiável de temperatura, umidade, chuva, vento e poluentes (como PM2,5 e PM10) para embasar decisões, agir preventivamente e informar a população.

### 🚀 O Desafio

Construir uma plataforma capaz de capturar continuamente dados de estações meteorológicas de baixo custo, processá-los de forma confiável e disponibilizá-los como série histórica estruturada — assegurando isolamento territorial entre municípios, controle de acesso por perfil, soberania de dados e resiliência na ingestão, de modo que nenhuma leitura de campo seja perdida.

### ✨ A Solução e Diferenciais

O **Pulso Urbano** implanta uma rede própria (MVP com **4 estações físicas ESP32** nas regiões Norte, Norte/Centro, Leste e Sul de SJC) equipada com **6 sensores por estação** (**PM2,5, PM10, temperatura, umidade relativa, velocidade do vento e chuva**), enviando leituras a cada 5 minutos. Os dados alimentam painéis públicos com cálculo de **IQAr** (Índice de Qualidade do Ar), séries históricas sem expurgo, exportação em CSV/JSON (Power BI/Excel) e alertas preventivos por e-mail.

* **100% Open Source (Licença R$ 0):** Toda a stack (incluindo a adoção do **Valkey** no lugar do Redis) utiliza software livre, sem custo de licenciamento para o município.
* **Operação 100% On-Premise (Sem Nuvem):** Roda diretamente em infraestrutura física local (**Ubuntu Server 24.04 LTS**, sem Docker ou VMs em produção), garantindo soberania dos dados e custo zero de nuvem.
* **Resiliência e Independência:** Pluviômetro embarcado em cada estação (sem depender de redes externas) e pipeline com **MQTT QoS 1**, staging no **Valkey** e filas **RabbitMQ com DLQ**.
* **Alta Escalabilidade com Baixo Hardware:** Com cache de 30s no **Nginx 1.30**, suporta até **12.672 req/s** (p95 de 6 ms a 38 ms), atendendo picos de acesso da população (~700 mil habitantes).

![Arquitetura da plataforma](docs/arquitetura.png)

#### 🔄 Arquitetura de Software e Topologia Física (Bare-Metal)

A plataforma é organizada em **dois fluxos independentes**: um **fluxo assíncrono de telemetria**, no qual as estações publicam via MQTT e o serviço de ingestão grava a leitura bruta no **Valkey** antes de enviá-la pelo **RabbitMQ** para validação, calibração e persistência definitiva no **PostgreSQL** (sem expurgo) — garantindo que quedas no broker ou no banco nunca causem perda de dados em campo —; e um **fluxo síncrono via API REST**, que atende o dashboard municipal, o portal público e as exportações. Detalhes dos serviços, topologia de servidores (S1–S4) e filas em [Arquitetura](docs/arquitetura.md) e [Eventos do Backend](docs/eventos.md).

---

## 📅 Sprints <a id="sprints"></a>

| Sprint | Período | Objetivo | Status |
| --- | --- | --- | :--: |
| [**Sprint 1**](docs/sprints/sprint-1.md) | 07/09 a 27/09 | **MVP 1:** Governança de Usuários, Autenticação, Gestão de Estações, Monitoramento de Conectividade e Regras de Alerta. | ✅ Encerrada |
| [**Sprint 2**](docs/sprints/sprint-2.md) | 05/10 a 25/10 | **MVP 2:** Recepção de dados de ponta a ponta (ingestão, validação, calibração e gravação) + alertas e alarmes. | ✅ Encerrada |
| [**Sprint 3**](docs/sprints/sprint-3.md) | 02/11 a 22/11 | **MVP 3:** Estação física funcionando, leituras guardadas primeiro no banco temporário (Valkey), painel e API pública com cadastro, período e cota por perfil, e entrega final na Prefeitura. | ✅ Encerrada |

<details>
<summary><b>Demonstrações</b></summary>

<br>

**Sprint 1**

![Demonstração do MVP da Sprint 1](assets/sprint-1/api4dsm-sprint1.gif)

**Sprint 2**

![Demonstração do MVP da Sprint 2](assets/sprint-2/mvp-sprint-2.gif)

**Sprint 3**

![Demonstração do MVP da Sprint 3](assets/sprint-3/mvp-sprint-3.gif)

</details>

---

## 📌 Backlog <a id="backlog"></a>

As sprints vêm em ordem de prioridade: a Sprint 1 antes da 2, e a 2 antes da 3. Dentro de cada sprint, o número da US segue a prioridade. Os itens de plataforma, DevOps e qualidade (EPIC-04) atravessam as sprints e ficam numa tabela própria. A fonte da prioridade é o campo Prioridade do Jira.

**Estimativa:** pontos na sequência de Fibonacci. Na Sprint 1 é o consenso do Planning Poker; nas Sprints 2 e 3 é uma estimativa preliminar por dificuldade relativa (máximo 8), ainda sem Planning Poker. \*As US-07 a US-10 têm 3 pontos nominais por sprint ativa, fora do Planning Poker. A US-27 (estação guarda as leituras) foi excluída do escopo e o número não foi reaproveitado.

<details>
<summary><b>Sprint 1 · 07/09 a 27/09 · fundação da plataforma (1ª Entrega)</b></summary>

| US | História | Prioridade | Estimativa | Status | Jira |
| :-: | --- | :-: | :-: | :-: | :-: |
| US-01 | Gestão administrativa de contas e perfis | Média | 5 | ✅ Finalizado | [ELEM-6](https://elementares-4sem.atlassian.net/browse/ELEM-6) |
| US-02 | Autenticação e controle de sessão | Média | 3 | ✅ Finalizado | [ELEM-11](https://elementares-4sem.atlassian.net/browse/ELEM-11) |
| US-03 | Cadastro e gestão de estações | Média | 5 | ✅ Finalizado | [ELEM-16](https://elementares-4sem.atlassian.net/browse/ELEM-16) |
| US-04 | Monitoramento de disponibilidade das estações | Média | 8 | ✅ Finalizado | [ELEM-23](https://elementares-4sem.atlassian.net/browse/ELEM-23) |
| US-05 | Parametrização e calibração de sensores | Média | 5 | ✅ Finalizado | [ELEM-27](https://elementares-4sem.atlassian.net/browse/ELEM-27) |
| US-06 | Regras e limiares de alerta | Média | 8 | ✅ Finalizado | [ELEM-32](https://elementares-4sem.atlassian.net/browse/ELEM-32) |

</details>

<details>
<summary><b>Sprint 2 · 05/10 a 25/10 · recepção de dados de ponta a ponta, alertas e alarmes</b></summary>

| US | História | Prioridade | Estimativa | Status | Jira |
| :-: | --- | :-: | :-: | :-: | :-: |
| US-11 | Receber leituras das estações via MQTT | Média | 5 | ✅ Finalizado | [ELEM-73](https://elementares-4sem.atlassian.net/browse/ELEM-73) |
| US-12 | Validar payload e estação ativa | Média | 3 | ✅ Finalizado | [ELEM-74](https://elementares-4sem.atlassian.net/browse/ELEM-74) |
| US-13 | Ignorar leituras duplicadas | Média | 2 | ✅ Finalizado | [ELEM-75](https://elementares-4sem.atlassian.net/browse/ELEM-75) |
| US-14 | Gravar no banco temporário (staging) e atualizar o último sinal | Média | 3 | ✅ Finalizado | [ELEM-76](https://elementares-4sem.atlassian.net/browse/ELEM-76) |
| US-15 | Publicar em `telemetria.bruta` | Média | 5 | ✅ Finalizado | [ELEM-77](https://elementares-4sem.atlassian.net/browse/ELEM-77) |
| US-17 | Calibrar e gravar em `medidas` | Média | 5 | ✅ Finalizado | [ELEM-79](https://elementares-4sem.atlassian.net/browse/ELEM-79) |
| US-18 | Tratar leituras de sensor inexistente ou inativo | Média | 3 | ✅ Finalizado | [ELEM-80](https://elementares-4sem.atlassian.net/browse/ELEM-80) |
| US-19 | Marcar como inválido o valor fisicamente impossível | Média | 2 | ✅ Finalizado | [ELEM-81](https://elementares-4sem.atlassian.net/browse/ELEM-81) |
| US-20 | Tratar falha de gravação e reenviar eventos da DLQ | Média | 5 | ✅ Finalizado | [ELEM-82](https://elementares-4sem.atlassian.net/browse/ELEM-82) |
| US-22 | Avaliar regras de alerta e registrar alarme | Média | 8 | ✅ Finalizado | [ELEM-137](https://elementares-4sem.atlassian.net/browse/ELEM-137) |
| US-23 | Avisar gestores sobre alarme disparado | Média | 5 | ✅ Finalizado | [ELEM-138](https://elementares-4sem.atlassian.net/browse/ELEM-138) |
| US-24 | Tela de alarmes e indicador | Média | 5 | ✅ Finalizado | [ELEM-139](https://elementares-4sem.atlassian.net/browse/ELEM-139) |

</details>

<details open>
<summary><b>Sprint 3 · 02/11 a 22/11 · estação física, API pública e entrega final</b></summary>

| US | História | Prioridade | Estimativa | Status | Jira |
| :-: | --- | :-: | :-: | :-: | :-: |
| US-26 | Estação envia as leituras dos sensores | Baixa | 8 | ✅ Finalizado | [ELEM-154](https://elementares-4sem.atlassian.net/browse/ELEM-154) |
| US-28 | Leitura antiga não gera alarme | Baixa | 3 | ✅ Finalizado | [ELEM-156](https://elementares-4sem.atlassian.net/browse/ELEM-156) |
| US-29 | Conexão das estações ao broker pelo MAC | Baixa | 3 | ✅ Finalizado | [ELEM-157](https://elementares-4sem.atlassian.net/browse/ELEM-157) |
| US-30 | Instalar, calibrar e aceitar a estação | Baixa | 5 | ✅ Finalizado | [ELEM-158](https://elementares-4sem.atlassian.net/browse/ELEM-158) |
| US-31 | Consultar medições e exportar em CSV | Baixa | 5 | ✅ Finalizado | [ELEM-159](https://elementares-4sem.atlassian.net/browse/ELEM-159) |
| US-35 | Dashboards da qualidade do ar e das estações | Baixa | 8 | ✅ Finalizado | [ELEM-182](https://elementares-4sem.atlassian.net/browse/ELEM-182) |
| US-36 | Fluxo completo do frontend | Baixa | 8 | ✅ Finalizado | [ELEM-183](https://elementares-4sem.atlassian.net/browse/ELEM-183) |
| US-37 | Fluxo completo do backend | Baixa | 5 | ✅ Finalizado | [ELEM-184](https://elementares-4sem.atlassian.net/browse/ELEM-184) |
| US-38 | Entregáveis de implantação na Prefeitura | Baixa | 8 | ✅ Finalizado | [ELEM-185](https://elementares-4sem.atlassian.net/browse/ELEM-185) |
| US-39 | Cadastrar qualquer grandeza | Baixa | 3 | ✅ Finalizado | [ELEM-261](https://elementares-4sem.atlassian.net/browse/ELEM-261) |
| US-40 | Valkey como banco temporário (staging) da recepção | Baixa | 8 | ✅ Finalizado | [ELEM-207](https://elementares-4sem.atlassian.net/browse/ELEM-207) |
| US-41 | Entrega do MVP 3 | Baixa | 3 | ✅ Finalizado | [ELEM-262](https://elementares-4sem.atlassian.net/browse/ELEM-262) |
| US-42 | API pública com cadastro, perfis e cotas | Baixa | 8 | ✅ Finalizado | [ELEM-263](https://elementares-4sem.atlassian.net/browse/ELEM-263) |

</details>

<details>
<summary><b>Plataforma, DevOps e Qualidade · itens contínuos</b></summary>

| US | História | Prioridade | Estimativa | Status | Jira |
| :-: | --- | :-: | :-: | :-: | :-: |
| US-07 | Documentação e rastreabilidade | Média | 3\* | ✅ Finalizado | [ELEM-58](https://elementares-4sem.atlassian.net/browse/ELEM-58) |
| US-08 | Repositórios e arquitetura de código | Média | 3\* | ✅ Finalizado | [ELEM-59](https://elementares-4sem.atlassian.net/browse/ELEM-59) |
| US-09 | Observabilidade e processos de QA | Média | 3\* | ✅ Finalizado | [ELEM-60](https://elementares-4sem.atlassian.net/browse/ELEM-60) |
| US-10 | Testes de integração e cobertura mínima | Média | 3\* | ✅ Finalizado | [ELEM-61](https://elementares-4sem.atlassian.net/browse/ELEM-61) |
| US-16 | Simulador de estações | Média | 5 | ✅ Finalizado | [ELEM-78](https://elementares-4sem.atlassian.net/browse/ELEM-78) |
| US-21 | Teste contínuo da ingestão | Média | 3 | ✅ Finalizado | [ELEM-136](https://elementares-4sem.atlassian.net/browse/ELEM-136) |
| US-25 | Testes unitários no backend | Média | 8 | ✅ Finalizado | [ELEM-116](https://elementares-4sem.atlassian.net/browse/ELEM-116) |
| US-32 | Processo de deploy automático | Média | 5 | ✅ Finalizado | [ELEM-130](https://elementares-4sem.atlassian.net/browse/ELEM-130) |
| US-33 | Monitoramento da infraestrutura e do fluxo de dados | Média | 5 | ✅ Finalizado | [ELEM-125](https://elementares-4sem.atlassian.net/browse/ELEM-125) |
| US-34 | Integração contínua (CI) | Baixa | 5 | ✅ Finalizado | [ELEM-181](https://elementares-4sem.atlassian.net/browse/ELEM-181) |

</details>

<details>
<summary><b>Spikes, bugs e débitos · itens de pesquisa</b></summary>

| Código | Tipo | Item | Sprint | Épico | Ticket |
| :-: | :-: | --- | :-: | :-: | :-: |
| SPIKE-01 | Spike | Viabilidade de um simulador de estações IoT, para testar o pipeline de ingestão sem depender de hardware físico. | 1 | EPIC-04 | ✅ Feito |
| SPIKE-02 | Spike | Definição do payload de telemetria (grandezas enviadas) e do intervalo de envio das estações. | 1 | EPIC-04 | ✅ Feito |
| TECH-DEBT-01 | Item Técnico | Unificação de nomenclatura de schema entre a documentação de arquitetura e as especificações de User Story. | 1 | EPIC-04 | ✅ Feito |
| BUGS-S1 | Bug | Caça-bugs na `develop` em 26/09: 58 achados (0 críticos, 11 urgentes, 17 perigosos, 14 de risco pequeno e 16 avisos), consolidados em 43 tickets com prioridade por severidade. | 1 | EPIC-04 | ✅ Feito |
| SPIKE-04 | Spike | Estudar MQTT, base da recepção de dados das estações (US-11). | 2 | EPIC-04 | ✅ Feito |
| SPIKE-05 | Spike | Estudar como simular o envio de dados das estações de forma fiel (US-16). | 2 | EPIC-04 | ✅ Feito |
| — | Spike | Estudo de contrato para apresentar ao cliente. | 2 | EPIC-04 | ✅ Feito |
| SPIKE-06 | Spike | Modelo de manutenção e correção de bugs para a Prefeitura (o pacote de 6 meses já está na Governança). | 3 | EPIC-04 | ✅ Feito |

> O código SPIKE-03 não foi usado: a numeração pula de SPIKE-02 para SPIKE-04.

</details>

O texto completo de cada história, o valor de negócio, os requisitos e as estimativas estão no [Backlog completo](docs/backlog.md).

---

## 📄 Documentação <a id="documentacao"></a>

| Página | O que tem |
| --- | --- |
| [Backlog](docs/backlog.md) | Backlog completo e resumo por prioridade, spikes e bugs |
| [Sprint 1](docs/sprints/sprint-1.md) · [Sprint 2](docs/sprints/sprint-2.md) · [Sprint 3](docs/sprints/sprint-3.md) | Meta, sprint backlog e demonstração de cada sprint |
| [Requisitos](docs/requisitos.md) | Requisitos funcionais e não funcionais e variáveis monitoradas |
| [Arquitetura](docs/arquitetura.md) | Microsserviços, stack, implantação na Prefeitura e modelo de dados |
| [Eventos do Backend](docs/eventos.md) | Fluxo de mensageria, topologia das filas no RabbitMQ, contratos de `telemetria.bruta` e `alarme.disparado` e tratamento de DLQ |
| [Processo](docs/processo.md) | DoR, DoD, CI/CD, branches, commits e governança do repositório |
| [Qualidade](docs/qualidade.md) | Estratégia de testes |
| [Instalação](docs/instalacao.md) | Pré-requisitos e execução local |

| Documento | Link | Situação |
| --- | --- | --- |
| Arquitetura do Sistema | [`Arquitetura.pdf`](docs/Arquitetura.pdf) | ✅ Atualizada para o Valkey (40.06) |
| Modelo de Dados | [`Modelo_de_Dados.pdf`](docs/Modelo_de_Dados.pdf) | ✅ Atualizado para o Valkey (40.06) |
| Infraestrutura Física (servidores) | [`arquitetura-fisica.pdf`](docs/arquitetura-fisica.pdf) · [`dimensionamento.pdf`](docs/dimensionamento.pdf) · [`estudo-cobertura-sjc.pdf`](docs/estudo-cobertura-sjc.pdf) | ✅ Finalizado (38.01, 38.02 e 38.03) |
| Softwares e Licenças | [`softwares-e-licencas.pdf`](docs/softwares-e-licencas.pdf) | ✅ Finalizado (38.04) |
| Estrutura do Software e Justificativas | [`estrutura-e-justificativas.pdf`](docs/estrutura-e-justificativas.pdf) | ✅ Finalizado (38.07) |
| Governança e Responsabilidades | [Arquitetura › Quem responde por quê](docs/arquitetura.md#governanca) | ✅ Finalizado |
| Manual de Instalação (Ubuntu Server) | [`manual-instalacao-ubuntu.pdf`](docs/manual-instalacao-ubuntu.pdf) | ✅ Finalizado (38.05) |
| Manual de Monitoramento | [`manual-monitoramento.pdf`](docs/manual-monitoramento.pdf) | ✅ Finalizado (38.06) |
| Manual da Estação (ESP32) | [`manual-estacao-esp32.pdf`](docs/manual-estacao-esp32.pdf) | ✅ Finalizado (US-30) |
| API pública (Swagger público) | No ambiente de produção | ✅ Finalizado (42.06) |
| Manual do Usuário | [`Manual_do_Usuario_Pulso_Urbano.pdf`](docs/Manual_do_Usuario_Pulso_Urbano.pdf) | ✅ Finalizado |

---

## 💻 Como executar <a id="executar"></a>

```bash
git clone --recurse-submodules https://github.com/ELEMENTARES-DSM/API-4SEMESTRE.git
cd API-4SEMESTRE/backend && cp .env.example .env && docker compose up -d
for svc in gestao-usuarios gestao-estacoes servico-validacao alertas-notificacoes ingestao-dados; do
  (cd services/$svc && npm ci && npm run migrate -- up)
done
cd ../frontend && cp .env.example .env && npm install && npm run dev
```

Preencha os dois `.env` antes de subir. As migrations rodam nessa ordem, porque as tabelas de cada serviço apontam para as dos anteriores. O passo a passo completo, com o DevContainer, está em [Instalação](docs/instalacao.md). Para instalar nos servidores da Prefeitura, use o [Manual de Instalação](docs/manual-instalacao-ubuntu.pdf).

---

## 🛠️ Tecnologias <a id="tecnologias"></a>

| Camada | Tecnologias |
| --- | --- |
| **Frontend** | React · Vite · TypeScript · Tailwind CSS · DaisyUI |
| **Backend** | Node.js · TypeScript · Express · biblioteca `pg` |
| **Banco de Dados** | PostgreSQL · Valkey (staging, tokens revogados e cotas da API) |
| **Mensageria** | MQTT (Mosquitto) · RabbitMQ |
| **Testes** | Vitest (frontend) · Jest (backend) |
| **Infraestrutura** | Docker · Docker Compose · DevContainers · Ubuntu Server |
| **Monitoramento** | Prometheus · Grafana |
| **CI/CD** | GitHub Actions · GitHub Rulesets |
| **Gestão** | Jira · Confluence |

---

## 🤝 Nossa Equipe <a id="equipe"></a>

| Nome | Scrum | DevOps | Redes Sociais |
| --- | --- | --- | --- |
| *João Moura* | Scrum Master | Monitoramento | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/JoaooMoura) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joaoomoura/) |
| *Lucas Inácio* | Product Owner (PO) | Testes Unitários | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/Lukitta013) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/luucasinacioo/) |
| *Ana Graciano* | DevTeam | QA (Garantia da Qualidade) | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/Ane-Graciano) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ana-graciano/) |
| *Gustavo Rosa* | DevTeam | Deploy Automático (CD) | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/gustasvos) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/gustavo-rosa-46a251180/) |
| *João Vitor Siqueira* | DevTeam | Rastreabilidade de Requisitos | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/kakashinho) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joao-vitor-siqueira-a2a2a3227/) |
| *Laís Zanardi* | DevTeam | Continuous Integration (CI) | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/lais-zanardi) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/lais-zanardi-inocencio/) |
| *Pedro Nascimento* | DevTeam | Testes de Integração | [![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat&logo=github&logoColor=white)](https://github.com/P3dr0213) [![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/pedro-nascimento-87a22937a/) |

---

<p align="center"><a href="docs/backlog.md">Backlog →</a></p>