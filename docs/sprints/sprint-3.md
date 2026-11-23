<p align="center">
<a href="../../README.md">🏠 Início</a> · <a href="../backlog.md">Backlog</a> · <a href="sprint-1.md">Sprint 1</a> · <a href="sprint-2.md">Sprint 2</a> · <b>Sprint 3</b> · <a href="../requisitos.md">Requisitos</a> · <a href="../arquitetura.md">Arquitetura</a> · <a href="../processo.md">Processo</a> · <a href="../qualidade.md">Qualidade</a> · <a href="../instalacao.md">Instalação</a>
</p>

# 🏃 Sprint 3 · 02/11 a 22/11 ✅

**MVP 3:** Estação física funcionando, leituras guardadas primeiro no banco temporário (Valkey), painel e API pública com cadastro, período e cota por perfil, e entrega final na Prefeitura. Encerrada em 22/11.

A meta foi **entregar a estação física funcionando e a plataforma aberta ao público**: a estação lê os sensores a cada 5 minutos e se identifica pelo MAC, cada leitura é guardada primeiro no banco temporário (Valkey) e chega ao painel sem se perder, os alarmes disparam, e o munícipe se cadastra e consulta os dados pela API pública, com período e cota por perfil.

| Capacidade estimada pela equipe | 75 pontos (Fibonacci) nas histórias de negócio (US-26 a US-42) |
| --- | :--: |
| **Meta da Sprint** | US-26, US-28 a US-31 e US-35 a US-42, mais a continuação da US-25, US-32, US-33 e US-34 |
| **Fora do escopo** | US-27 (estação guarda as leituras quando a rede cai): excluída em 18/11, em acordo com o cliente. O número não foi reaproveitado |

| Ordem | Prioridade | US | Ticket | Objetivo | Estimativa | Status |
| :--: | :--: | :--: | :--: | --- | :--: | :--: |
| 1 | Baixa | US-26 | ELEM-154 | Estação envia as leituras dos sensores | 8 | ✅ |
| 2 | Baixa | US-28 | ELEM-156 | Leitura antiga não gera alarme | 3 | ✅ |
| 3 | Baixa | US-29 | ELEM-157 | Conexão das estações ao broker pelo MAC | 3 | ✅ |
| 4 | Baixa | US-30 | ELEM-158 | Instalar, calibrar e aceitar a estação | 5 | ✅ |
| 5 | Baixa | US-31 | ELEM-159 | Consultar medições e exportar em CSV | 5 | ✅ |
| 6 | Baixa | US-35 | ELEM-182 | Dashboards da qualidade do ar e das estações | 8 | ✅ |
| 7 | Baixa | US-36 | ELEM-183 | Fluxo completo do frontend | 8 | ✅ |
| 8 | Baixa | US-37 | ELEM-184 | Fluxo completo do backend | 5 | ✅ |
| 9 | Baixa | US-38 | ELEM-185 | Entregáveis de implantação na Prefeitura | 8 | ✅ |
| 10 | Baixa | US-39 | ELEM-261 | Cadastrar qualquer grandeza | 3 | ✅ |
| 11 | Baixa | US-40 | ELEM-207 | Valkey como banco temporário (staging) da recepção | 8 | ✅ |
| 12 | Baixa | US-41 | ELEM-262 | Entrega do MVP 3 | 3 | ✅ |
| 13 | Baixa | US-42 | ELEM-263 | API pública com cadastro, perfis e cotas | 8 | ✅ |

**Plataforma, DevOps e Qualidade nesta sprint:**

| Ordem | Prioridade | US | Ticket | Objetivo | Estimativa | Status |
| :--: | :--: | :--: | :--: | --- | :--: | :--: |
| 1 | Média | US-07 | ELEM-58 | Documentação e rastreabilidade | 3\* | ✅ |
| 2 | Média | US-09 | ELEM-60 | Observabilidade e processos de QA | 3\* | ✅ |
| 3 | Média | US-25 | ELEM-116 | Testes unitários no backend e no frontend | 8 | ✅ |
| 4 | Média | US-32 | ELEM-130 | Processo de deploy automático | 5 | ✅ |
| 5 | Média | US-33 | ELEM-125 | Monitoramento da infraestrutura e do fluxo de dados | 5 | ✅ |
| 6 | Baixa | US-34 | ELEM-181 | Integração contínua (CI) | 5 | ✅ |

\*Estimativa nominal de engenharia por sprint, como no [Backlog](../backlog.md). Não entra na conta de velocidade.

**O que mudou durante a sprint:**

* **Estação pelo MAC (11/11, pedido do professor):** a estação se identifica pelo MAC da placa e publica na porta 1883 sem senha nem certificado próprio. A US-29 foi revisada para isso, e o broker fica restrito à rede das estações.
* **Valkey no lugar do Redis (US-40):** toda leitura é gravada no banco temporário antes de qualquer verificação; o PostgreSQL guarda só o dado tratado.
* **Munícipe no lugar do Pesquisador (19/11):** os papéis passaram a ser Administrador, Gestor Público e Munícipe.
* **US-27 excluída (18/11):** a pedido do cliente, para reduzir o escopo da sprint.

**Entregáveis:** [Manual do Usuário](../Manual_do_Usuario_Pulso_Urbano.pdf), [Manual de Instalação](../manual-instalacao-ubuntu.pdf), [Manual da Estação ESP32](../manual-estacao-esp32.pdf), [Manual de Monitoramento](../manual-monitoramento.pdf), [Arquitetura Física](../arquitetura-fisica.pdf), [Dimensionamento](../dimensionamento.pdf), [Estudo de Cobertura de SJC](../estudo-cobertura-sjc.pdf), [Softwares e Licenças](../softwares-e-licencas.pdf) e [Estrutura e Justificativas](../estrutura-e-justificativas.pdf).

### 🎬 Demonstração

![Demonstração do MVP da Sprint 3](../../assets/sprint-3/mvp-sprint-3.gif)

---

<p align="center"><a href="sprint-2.md">← Sprint 2</a> | <a href="../requisitos.md">Requisitos →</a></p>
