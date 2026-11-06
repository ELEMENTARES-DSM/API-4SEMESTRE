<p align="center">
<a href="../../README.md">🏠 Início</a> · <a href="../backlog.md">Backlog</a> · <a href="sprint-1.md">Sprint 1</a> · <a href="sprint-2.md">Sprint 2</a> · <b>Sprint 3</b> · <a href="../requisitos.md">Requisitos</a> · <a href="../arquitetura.md">Arquitetura</a> · <a href="../processo.md">Processo</a> · <a href="../qualidade.md">Qualidade</a> · <a href="../instalacao.md">Instalação</a>
</p>

# 🏃 Sprint 3 · 02/11 a 22/11 🔄

**MVP 3:** Estação física funcionando, leituras guardadas primeiro no banco temporário (Valkey), painel e API pública com cadastro, período e cota por perfil, e entrega final na Prefeitura.

A meta é **entregar a estação física funcionando e a plataforma aberta ao público**: a estação lê os sensores a cada 5 minutos, cada leitura é guardada primeiro no banco temporário (Valkey) e chega ao painel sem se perder, os alarmes disparam, e o munícipe se cadastra e consulta os dados pela API pública, com período e cota por perfil.

| Capacidade estimada pela equipe | A definir |
| --- | :--: |
| **Meta da Sprint** | US-26 a US-31, US-34 a US-42 e a continuação da US-25, US-32 e US-33 |
| **Previsão (extras, sem compromisso)** | Calibração automática da estação (tasks Extra da US-30) |

| Ordem | Prioridade | US | Ticket | Objetivo | Estimativa |
| :--: | :--: | :--: | :--: | --- | :--: |
| 1 | Baixa | US-26 | ELEM-154 | Estação envia as leituras dos sensores | a definir |
| 2 | Baixa | US-27 | ELEM-155 | Estação guarda as leituras quando a rede cai | a definir |
| 3 | Baixa | US-28 | ELEM-156 | Leitura antiga não gera alarme | a definir |
| 4 | Baixa | US-29 | ELEM-157 | Acesso de cada estação ao broker | a definir |
| 5 | Baixa | US-30 | ELEM-158 | Instalar, calibrar e aceitar a estação | a definir |
| 6 | Baixa | US-31 | ELEM-159 | Consultar medições e exportar em CSV | a definir |
| 7 | Baixa | US-35 | ELEM-182 | Dashboards da qualidade do ar e das estações | a definir |
| 8 | Baixa | US-36 | ELEM-183 | Fluxo completo do frontend | a definir |
| 9 | Baixa | US-37 | ELEM-184 | Fluxo completo do backend | a definir |
| 10 | Baixa | US-38 | ELEM-185 | Entregáveis de implantação na Prefeitura | a definir |
| 11 | Baixa | US-39 | ELEM-261 | Cadastrar qualquer grandeza | a definir |
| 12 | Baixa | US-40 | ELEM-207 | Valkey como banco temporário (staging) da recepção | a definir |
| 13 | Baixa | US-41 | ELEM-262 | Entrega do MVP 3 | a definir |
| 14 | Baixa | US-42 | ELEM-263 | API pública com cadastro, perfis e cotas | a definir |

**Plataforma, DevOps e Qualidade nesta sprint:**

| Ordem | Prioridade | US | Ticket | Objetivo | Estimativa |
| :--: | :--: | :--: | :--: | --- | :--: |
| 1 | Alta | US-07 | ELEM-58 | Documentação e rastreabilidade | 3\* |
| 2 | Alta | US-09 | ELEM-60 | Observabilidade e processos de QA | 3\* |
| 3 | Média | US-25 | ELEM-116 | Testes unitários no backend | — |
| 4 | Média | US-32 | ELEM-130 | Processo de deploy automático | — |
| 5 | Média | US-33 | ELEM-125 | Monitoramento da infraestrutura e do fluxo de dados | — |
| 6 | Baixa | US-34 | ELEM-181 | Integração contínua (CI) | a definir |

**Ordem de execução:** o número da US segue a prioridade; a ordem em que as tasks são feitas está nos vínculos "é bloqueada por" do Jira. Os dois caminhos que não podem atrasar:

* **Estação:** separar os containers (32.2) → homologação pronta até 10/11 (32.3) → broker no ambiente de entrega (29.04) → verificar a estação real (26.05) → aceite de 24 h, começando até 18/11 (30.07).
* **API pública e entrega:** rotas de dados (35.06 → 35.09) → período e cota por perfil (42.04 → 42.05) → Swagger público (42.06 → 32.6) → promover para a `main` com tag (41.01) → submódulos (41.02).

**Pendências para o DoR:** placa e sensores são fornecidos pelo cliente — ao chegarem, conferir se a placa tem Wi-Fi, memória flash e suporte a TLS 1.2 com certificado de cliente (exigido pelo Mosquitto), porque as US-26, US-27 e US-29 contam com isso. Confirmar também o IP fixo do servidor na rede local e se essa rede tem acesso a NTP.

### 🎬 Demonstração

_Em breve (task 41.04)._

---

<p align="center"><a href="sprint-2.md">← Sprint 2</a> | <a href="../requisitos.md">Requisitos →</a></p>
