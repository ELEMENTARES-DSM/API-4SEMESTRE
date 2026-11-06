<p align="center">
[🏠 Início](../README.md) · [Backlog](backlog.md) · [Sprint 1](sprints/sprint-1.md) · [Sprint 2](sprints/sprint-2.md) · [Sprint 3](sprints/sprint-3.md) · [Requisitos](requisitos.md) · [Arquitetura](arquitetura.md) · [Processo](processo.md) · **Qualidade** · [Instalação](instalacao.md)
</p>

# 🛡️ Testes e Qualidade

A estratégia de garantia de qualidade contempla:

* **Ferramentas:** [Vitest](https://vitest.dev/) no frontend, reaproveitando a configuração já existente do Vite, e [Jest](https://jestjs.io/) nos microsserviços do backend.
* **Testes de Unidade:** Validação da lógica de negócio crítica — conversão de leituras (equação afim), avaliação de regras de alerta e validação de dados de entrada.
* **Testes de Integração:** Validação da comunicação entre a API e o banco de dados em ambiente controlado por containers.
* **Testes de API:** Validação de contratos HTTP, status codes (200, 201, 400, 401, 403, 409, 429) e payloads.
* **Rastreabilidade de Testes:** Cada User Story termina com uma task de verificação (QA) no Jira, com o checklist dos cenários executados.
* **Execução Automatizada:** A suíte é executada a cada Pull Request e bloqueia o merge em caso de falha.
* **Backend (US-25):** testes unitários da lógica de negócio sem acessar banco, fila ou rede; testes de integração das rotas, no caso de sucesso e em cada erro previsto, com PostgreSQL real em container (só RabbitMQ, Valkey e MQTT podem ser simulados); cada teste parte de um banco limpo; isolamento por município testado; cobertura mínima de 70% sobre a lógica de negócio, reportada no pipeline e verificada no PR.

---

<p align="center">[← Processo](processo.md) | [Instalação →](instalacao.md)</p>
