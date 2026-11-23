<p align="center">
<a href="../README.md">🏠 Início</a> · <a href="backlog.md">Backlog</a> · <a href="sprints/sprint-1.md">Sprint 1</a> · <a href="sprints/sprint-2.md">Sprint 2</a> · <a href="sprints/sprint-3.md">Sprint 3</a> · <a href="requisitos.md">Requisitos</a> · <a href="arquitetura.md">Arquitetura</a> · <a href="processo.md">Processo</a> · <a href="qualidade.md">Qualidade</a> · <b>Instalação</b>
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

> Os submódulos apontam para um commit específico de cada repositório. O desenvolvimento acontece diretamente no **BACKEND-4SEMESTRE** e no **FRONTEND-4SEMESTRE**; os ponteiros deste repositório são atualizados ao final de cada sprint, para o commit da `main` entregue (task 41.02).

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

# 4. Migrations, por serviço e nesta ordem (as tabelas de cada um apontam para as dos anteriores)
for svc in gestao-usuarios gestao-estacoes servico-validacao alertas-notificacoes ingestao-dados; do
  (cd services/$svc && npm ci && npm run migrate -- up)
done

# 5. Frontend (deixe VITE_API_URL vazio no .env para usar o proxy do Vite)
cd ../frontend
cp .env.example .env
npm install
npm run dev
# Aplicação em http://localhost:5173
```

> Na instalação nos servidores, o script de deploy roda as migrations sozinho, na mesma ordem (task 37.2). Na execução local com o compose, o passo 4 continua manual. A instalação nos servidores da Prefeitura, com as variáveis de ambiente e a solução de problemas comuns, está no [Manual de Instalação](manual-instalacao-ubuntu.pdf).

> O projeto também disponibiliza configuração de **DevContainer**, permitindo abrir o ambiente já padronizado diretamente no VS Code, sem configuração manual.

---

<p align="center"><a href="qualidade.md">← Qualidade</a></p>
