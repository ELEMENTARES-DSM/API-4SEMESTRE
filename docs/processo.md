<p align="center">
[🏠 Início](../README.md) · [Backlog](backlog.md) · [Sprint 1](sprints/sprint-1.md) · [Sprint 2](sprints/sprint-2.md) · [Sprint 3](sprints/sprint-3.md) · [Requisitos](requisitos.md) · [Arquitetura](arquitetura.md) · **Processo** · [Qualidade](qualidade.md) · [Instalação](instalacao.md)
</p>

# ⚙️ Processo de Desenvolvimento

As práticas técnicas da equipe Elementares unem o desenvolvimento de software (Dev) à infraestrutura e qualidade (Ops) com transparência, visando entregas incrementais e rastreáveis.

### 🎯 Critérios de Aceite (DoR e DoD)

**Definition of Ready (DoR):**

* User Story escrita no padrão ágil (**Como / Quero / Para**).
* Critérios de aceitação definidos no formato BDD (**Dado / Quando / Então**).
* Requisitos Funcionais e Não Funcionais associados e mapeados no Confluence.
* Dicionário de dados da entidade validado com tipos SQL e TypeScript.
* Cada task com as tasks que ela espera registradas no Jira (**é bloqueada por**), sem dependência circular.
* Toda task de tela com o desenho no Figma pronto antes.

**Definition of Done (DoD):**

* Código implementado segundo os padrões arquiteturais do repositório.
* Subtarefas do Jira finalizadas e horas de esforço apontadas no card pai.
* Toda task de código com testes unitários e de integração validando os cenários da história.
* No backend, toda rota nova ou alterada documentada no OpenAPI, com o `docs:validate` verde no CI.
* Pull Request revisado e aprovado por pelo menos um membro do Dev Team (**peer review**).
* Rastreabilidade amarrada no Jira e no Confluence.
* Entrega homologada formalmente pelo Product Owner na coluna **Validação PO**.

### 🚀 Pipeline de Entrega (CI/CD)

1. **Planejamento:** PO e Dev Team refinam requisitos no Confluence e organizam tarefas no Jira, com as dependências entre elas.
2. **Desenvolvimento:** Criação de branches a partir da `develop`, associadas ao ticket.
3. **Qualidade e CI:** GitHub Actions executa validação de tipos TypeScript, lint, testes automatizados e `docs:validate` a cada Pull Request.
4. **Code Review:** Pull Requests exigem aprovação de pelo menos um par antes do merge.
5. **Homologação:** a versão candidata vai para uma branch `release/*` e roda no ambiente de homologação.
6. **Produção:** o que foi validado na homologação é promovido para a `main`, com tag de versão; a produção expõe só o Swagger público.

### 🔀 Padrão de Versionamento e Commits

A rastreabilidade entre o código no GitHub e os cartões do Jira é mandatória.

**Fluxo de trabalho:** `feature/*` → `develop` → `release/*` → `main`

Os repositórios de código (backend e frontend) estão configurados para aceitar **exclusivamente squash merge**, e a mensagem do commit é gerada a partir do **título do Pull Request**. Por isso, o título do PR deve seguir o padrão do squad — é ele que chega na `develop`.

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

| Tipo           | Padrão                                 |
| -------------- | --------------------------------------- |
| Funcionalidade | `feat/ELEM-XX-nome-da-funcionalidade` |
| Correção     | `fix/ELEM-XX-descricao-do-ajuste`     |
| Documentação | `docs/ELEM-XX-atualizacao-documento`  |

### 🛡️ Governança do Repositório

Nos repositórios **BACKEND-4SEMESTRE** e **FRONTEND-4SEMESTRE**, as branches `main` e `develop` são protegidas por *ruleset*, exigindo:

* Pull Request aprovado por pelo menos um revisor antes do merge;
* Aprovação nos checks automatizados da esteira de CI;
* Bloqueio de *force push* e de deleção de branch.

---

<p align="center">[← Arquitetura](arquitetura.md) | [Qualidade →](qualidade.md)</p>
