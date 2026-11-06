<p align="center">
[🏠 Início](../README.md) · [Backlog](backlog.md) · [Sprint 1](sprints/sprint-1.md) · [Sprint 2](sprints/sprint-2.md) · [Sprint 3](sprints/sprint-3.md) · [Requisitos](requisitos.md) · [Arquitetura](arquitetura.md) · [Processo](processo.md) · [Qualidade](qualidade.md) · **Instalação**
</p>

# 💻 Instalação e Execução Local

## 📂 Estrutura deste Repositório

```
API-4SEMESTRE/
├── backend/    → submódulo do BACKEND-4SEMESTRE
├── frontend/   → submódulo do FRONTEND-4SEMESTRE
├── assets/     → materiais de entrega por sprint (demonstrações)
├── docs/       → documentação do produto (arquitetura e manuais)
└── README.md
```

> Os submódulos apontam para um commit específico de cada repositório. O desenvolvimento acontece diretamente no **BACKEND-4SEMESTRE** e no **FRONTEND-4SEMESTRE**; os ponteiros deste repositório são atualizados ao final de cada sprint, para a tag da versão entregue.

## Pré-requisitos

* Git
* Docker e Docker Compose
* Node.js 22 ou superior e npm

## Execução Local (Resumo)

```bash
# 1. Clonar o repositório com os submódulos
git clone --recurse-submodules https://github.com/ELEMENTARES-DSM/API-4SEMESTRE.git
cd API-4SEMESTRE

# 2. Backend: configurar variáveis (o .env.example vem vazio; preencha antes de subir)
cd backend
cp .env.example .env

# 3. Subir os containers (PostgreSQL, Valkey, RabbitMQ, Mosquitto e microsserviços)
docker compose up -d

# 4. Migrations, por serviço e nesta ordem
for svc in gestao-usuarios gestao-estacoes alertas-notificacoes; do
  (cd services/$svc && npm ci && npm run migrate -- up)
done

# 5. Frontend (deixe VITE_API_URL vazio no .env para usar o proxy do Vite)
cd ../frontend
cp .env.example .env
npm install
npm run dev
# Aplicação em http://localhost:5173
```

> O passo 4 deixa de ser manual com a task 37.2 (migrations ao subir o compose). O passo a passo completo, com as variáveis de ambiente e a solução de problemas comuns, estará no **Manual de Instalação**, atualmente em validação.

> O projeto também disponibiliza configuração de **DevContainer**, permitindo abrir o ambiente já padronizado diretamente no VS Code, sem configuração manual.

---

<p align="center">[← Qualidade](qualidade.md)</p>
