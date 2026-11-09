<p align="center">
<a href="../README.md">🏠 Início</a> · <b>Backlog</b> · <a href="sprints/sprint-1.md">Sprint 1</a> · <a href="sprints/sprint-2.md">Sprint 2</a> · <a href="sprints/sprint-3.md">Sprint 3</a> · <a href="requisitos.md">Requisitos</a> · <a href="arquitetura.md">Arquitetura</a> · <a href="processo.md">Processo</a> · <a href="qualidade.md">Qualidade</a> · <a href="instalacao.md">Instalação</a>
</p>

# 📋 Backlog do Produto

**Como ler a prioridade:**

* As sprints vêm em ordem: tudo da Sprint 1 tem prioridade sobre a Sprint 2, e tudo da Sprint 2 sobre a Sprint 3.
* Dentro de cada sprint, o número da US segue a prioridade: nenhuma US vem antes de outra de prioridade mais alta. Nenhuma US foi renumerada.
* Os itens de plataforma, DevOps e qualidade (EPIC-04) atravessam as sprints e ficam numa tabela própria, com a prioridade da sprint em que começaram.
* A fonte da prioridade é o campo Prioridade do Jira (High = Alta, Medium = Média, Low = Baixa; Highest e Lowest não são usados). Este README e o Confluence copiam dele.
* A ordem de execução das tasks está nos vínculos "é bloqueada por" do Jira.

## Resumo por prioridade

<details>
<summary><b>Sprint 1 · 07/09 a 27/09 · fundação da plataforma (1ª Entrega)</b></summary>

| US | História | Prioridade | Status | Jira |
| :--: | --- | :--: | :--: | :--: |
| US-01 | Gestão administrativa de contas e perfis | Alta | ✅ Finalizado | [ELEM-6](https://elementares-4sem.atlassian.net/browse/ELEM-6) |
| US-02 | Autenticação e controle de sessão | Alta | ✅ Finalizado | [ELEM-11](https://elementares-4sem.atlassian.net/browse/ELEM-11) |
| US-03 | Cadastro e gestão de estações | Alta | ✅ Finalizado | [ELEM-16](https://elementares-4sem.atlassian.net/browse/ELEM-16) |
| US-04 | Monitoramento de disponibilidade das estações | Alta | ✅ Finalizado | [ELEM-23](https://elementares-4sem.atlassian.net/browse/ELEM-23) |
| US-05 | Parametrização e calibração de sensores | Alta | ✅ Finalizado | [ELEM-27](https://elementares-4sem.atlassian.net/browse/ELEM-27) |
| US-06 | Regras e limiares de alerta | Alta | ✅ Finalizado | [ELEM-32](https://elementares-4sem.atlassian.net/browse/ELEM-32) |

</details>

<details>
<summary><b>Sprint 2 · 05/10 a 25/10 · recepção de dados de ponta a ponta, alertas e alarmes</b></summary>

| US | História | Prioridade | Status | Jira |
| :--: | --- | :--: | :--: | :--: |
| US-11 | Receber leituras das estações via MQTT | Média | ✅ Finalizado | [ELEM-73](https://elementares-4sem.atlassian.net/browse/ELEM-73) |
| US-12 | Validar payload e estação ativa | Média | ✅ Finalizado | [ELEM-74](https://elementares-4sem.atlassian.net/browse/ELEM-74) |
| US-13 | Ignorar leituras duplicadas | Média | ✅ Finalizado | [ELEM-75](https://elementares-4sem.atlassian.net/browse/ELEM-75) |
| US-14 | Gravar no staging e atualizar o último sinal | Média | ✅ Finalizado | [ELEM-76](https://elementares-4sem.atlassian.net/browse/ELEM-76) |
| US-15 | Publicar em `telemetria.bruta` | Média | ✅ Finalizado | [ELEM-77](https://elementares-4sem.atlassian.net/browse/ELEM-77) |
| US-17 | Calibrar e gravar em `medidas` | Média | ✅ Finalizado | [ELEM-79](https://elementares-4sem.atlassian.net/browse/ELEM-79) |
| US-18 | Tratar leituras de sensor inexistente ou inativo | Média | ✅ Finalizado | [ELEM-80](https://elementares-4sem.atlassian.net/browse/ELEM-80) |
| US-19 | Marcar como inválido o valor fisicamente impossível | Média | ✅ Finalizado | [ELEM-81](https://elementares-4sem.atlassian.net/browse/ELEM-81) |
| US-20 | Tratar falha de gravação e reenviar eventos da DLQ | Média | ✅ Finalizado | [ELEM-82](https://elementares-4sem.atlassian.net/browse/ELEM-82) |
| US-22 | Avaliar regras de alerta e registrar alarme | Média | ✅ Finalizado | [ELEM-137](https://elementares-4sem.atlassian.net/browse/ELEM-137) |
| US-23 | Avisar gestores sobre alarme disparado | Média | ✅ Finalizado | [ELEM-138](https://elementares-4sem.atlassian.net/browse/ELEM-138) |
| US-24 | Tela de alarmes e indicador | Média | ✅ Finalizado | [ELEM-139](https://elementares-4sem.atlassian.net/browse/ELEM-139) |

</details>

<details open>
<summary><b>Sprint 3 · 02/11 a 22/11 · estação física, API pública e entrega final</b></summary>

| US | História | Prioridade | Status | Jira |
| :--: | --- | :--: | :--: | :--: |
| US-26 | Estação envia as leituras dos sensores | Baixa | Pronto (DoR ok) | [ELEM-154](https://elementares-4sem.atlassian.net/browse/ELEM-154) |
| US-27 | Estação guarda as leituras quando a rede cai | Baixa | Pronto (DoR ok) | [ELEM-155](https://elementares-4sem.atlassian.net/browse/ELEM-155) |
| US-28 | Leitura antiga não gera alarme | Baixa | Validação PO | [ELEM-156](https://elementares-4sem.atlassian.net/browse/ELEM-156) |
| US-29 | Acesso de cada estação ao broker | Baixa | Pronto (DoR ok) | [ELEM-157](https://elementares-4sem.atlassian.net/browse/ELEM-157) |
| US-30 | Instalar, calibrar e aceitar a estação | Baixa | Pronto (DoR ok) | [ELEM-158](https://elementares-4sem.atlassian.net/browse/ELEM-158) |
| US-31 | Consultar medições e exportar em CSV | Baixa | Validação PO | [ELEM-159](https://elementares-4sem.atlassian.net/browse/ELEM-159) |
| US-35 | Dashboards da qualidade do ar e das estações | Baixa | Pronto (DoR ok) | [ELEM-182](https://elementares-4sem.atlassian.net/browse/ELEM-182) |
| US-36 | Fluxo completo do frontend | Baixa | Pronto (DoR ok) | [ELEM-183](https://elementares-4sem.atlassian.net/browse/ELEM-183) |
| US-37 | Fluxo completo do backend | Baixa | Pronto (DoR ok) | [ELEM-184](https://elementares-4sem.atlassian.net/browse/ELEM-184) |
| US-38 | Entregáveis de implantação na Prefeitura | Baixa | Pronto (DoR ok) | [ELEM-185](https://elementares-4sem.atlassian.net/browse/ELEM-185) |
| US-39 | Cadastrar qualquer grandeza | Baixa | A fazer | [ELEM-261](https://elementares-4sem.atlassian.net/browse/ELEM-261) |
| US-40 | Valkey como banco temporário (staging) da recepção | Baixa | Pronto (DoR ok) | [ELEM-207](https://elementares-4sem.atlassian.net/browse/ELEM-207) |
| US-41 | Entrega do MVP 3 | Baixa | A fazer | [ELEM-262](https://elementares-4sem.atlassian.net/browse/ELEM-262) |
| US-42 | API pública com cadastro, perfis e cotas | Baixa | A fazer | [ELEM-263](https://elementares-4sem.atlassian.net/browse/ELEM-263) |

</details>

<details>
<summary><b>Plataforma, DevOps e Qualidade · itens contínuos</b></summary>

| US | História | Prioridade | Status | Jira |
| :--: | --- | :--: | :--: | :--: |
| US-07 | Documentação e rastreabilidade | Alta | 🔄 Em andamento | [ELEM-58](https://elementares-4sem.atlassian.net/browse/ELEM-58) |
| US-08 | Repositórios e arquitetura de código | Alta | ✅ Finalizado | [ELEM-59](https://elementares-4sem.atlassian.net/browse/ELEM-59) |
| US-09 | Observabilidade e processos de QA | Alta | 🔄 Em andamento | [ELEM-60](https://elementares-4sem.atlassian.net/browse/ELEM-60) |
| US-10 | Testes de integração e cobertura mínima | Alta | ✅ Finalizado | [ELEM-61](https://elementares-4sem.atlassian.net/browse/ELEM-61) |
| US-16 | Simulador de estações | Média | ✅ Finalizado | [ELEM-78](https://elementares-4sem.atlassian.net/browse/ELEM-78) |
| US-21 | Teste contínuo da ingestão | Média | ✅ Finalizado | [ELEM-136](https://elementares-4sem.atlassian.net/browse/ELEM-136) |
| US-25 | Testes unitários no backend | Média | 🔄 Em andamento | [ELEM-116](https://elementares-4sem.atlassian.net/browse/ELEM-116) |
| US-32 | Processo de deploy automático | Média | 🔄 Em andamento | [ELEM-130](https://elementares-4sem.atlassian.net/browse/ELEM-130) |
| US-33 | Monitoramento da infraestrutura e do fluxo de dados | Média | 🔄 Em andamento | [ELEM-125](https://elementares-4sem.atlassian.net/browse/ELEM-125) |
| US-34 | Integração contínua (CI) | Baixa | Pronto (DoR ok) | [ELEM-181](https://elementares-4sem.atlassian.net/browse/ELEM-181) |

</details>

<details>
<summary><b>Spikes, bugs e débitos · itens de pesquisa</b></summary>

| Código | Tipo | Item | Sprint | Épico | Ticket |
| :--: | :--: | --- | :--: | :--: | :--: |
| SPIKE-01 | Spike | Viabilidade de um simulador de estações IoT, para testar o pipeline de ingestão sem depender de hardware físico. | 1 | EPIC-04 | _a criar_ |
| SPIKE-02 | Spike | Definição do payload de telemetria (grandezas enviadas) e do intervalo de envio das estações. | 1 | EPIC-04 | _a criar_ |
| TECH-DEBT-01 | Item Técnico | Unificação de nomenclatura de schema entre a documentação de arquitetura e as especificações de User Story. | 1 | EPIC-04 | _a criar_ |
| BUGS-S1 | Bug | Caça-bugs na `develop` em 26/09: 58 achados (0 críticos, 11 urgentes, 17 perigosos, 14 de risco pequeno e 16 avisos), consolidados em 43 tickets com prioridade por severidade. | 1 | EPIC-04 | _em abertura_ |
| SPIKE-04 | Spike | Estudar MQTT, base da recepção de dados das estações (US-11). | 2 | EPIC-04 | ELEM-87 |
| SPIKE-05 | Spike | Estudar como simular o envio de dados das estações de forma fiel (US-16). | 2 | EPIC-04 | ELEM-88 |
| — | Spike | Estudo de contrato para apresentar ao cliente. | 2 | EPIC-04 | ELEM-120 |
| SPIKE-06 | Spike | Modelo de manutenção e correção de bugs para a Prefeitura (o pacote de 6 meses já está na Governança). | 3 | EPIC-04 | _a criar_ |

</details>

O texto completo de cada história, o valor de negócio, os requisitos e as estimativas estão no [Backlog completo](#backlog-completo).

## Backlog completo

### Sprint 1

| US | Tipo | Valor de Negócio | História | Épico | Ticket | Requisitos | Pontos | Prioridade | Status |
| :--: | :--: | --- | --- | :--: | :--: | --- | :--: | :--: | :--: |
| **US-01** | Negócio | Sem controle de identidade e papéis, nenhuma outra funcionalidade pode restringir acesso por perfil — é o alicerce de todo o isolamento territorial do produto. | Como administrador, quero gerenciar contas e papéis hierárquicos para controlar o acesso de gestores e pesquisadores na plataforma. | EPIC-01 | ELEM-6 | RF-11, RF-13, RNF-01, RNF-12, RNF-13 | 5 | Alta | ✅ Finalizado |
| **US-02** | Negócio | Garante que cada usuário só opere dentro do que seu perfil permite; sem isso, o isolamento territorial da US-01 não é aplicado em tempo de uso. | Como usuário cadastrado, quero me autenticar com credenciais corporativas e sessão segura para acessar as áreas e dados restritos ao meu perfil. | EPIC-01 | ELEM-11 | RF-12, RF-13, RNF-01, RNF-09, RNF-12 | 3 | Alta | ✅ Finalizado |
| **US-03** | Negócio | Sem estação cadastrada não existe fonte de dado nenhuma — é a entidade central de todo o pipeline de coleta. | Como gestor público, quero cadastrar e gerenciar estações meteorológicas georreferenciadas para manter o inventário territorial sob governança municipal. | EPIC-02 | ELEM-16 | RF-13, RF-14, RNF-01 | 5 | Alta | ✅ Finalizado |
| **US-04** | Negócio | Entrega nomeada na 1ª Entrega ao cliente: garante que uma falha de campo seja percebida antes que vire lacuna nos dados. | Como gestor público, quero monitorar a conectividade e disponibilidade das estações para identificar quedas de sinal e falhas operacionais. | EPIC-03 | ELEM-23 | RF-15, RNF-01, RNF-10 | 8 | Alta | ✅ Finalizado |
| **US-05** | Negócio | Sem calibração correta, os valores de PM2.5 e temperatura ficam incorretos — inviabiliza a classificação de qualidade do ar prometida na 1ª Entrega. | Como gestor público, quero parametrizar e calibrar os sensores associados às estações para que as leituras brutas sejam convertidas em grandezas reais. | EPIC-02 | ELEM-27 | RF-13, RF-16, RNF-01, RNF-13 | 5 | Alta | ✅ Finalizado |
| **US-06** | Negócio | É o motor do IQAr: converte leitura calibrada em alerta ambiental acionável — a entrega central do MVP apresentada ao cliente. | Como técnico da Defesa Civil, quero configurar regras de alerta e limiares críticos para disparar avisos preventivos em condições ambientais severas. | EPIC-03 | ELEM-32 | RF-13, RF-17, RNF-01, RNF-13 | 8 | Alta | ✅ Finalizado |

### Sprint 2

| US | Tipo | Valor de Negócio | História | Épico | Ticket | Requisitos | Pontos | Prioridade | Status |
| :--: | :--: | --- | --- | :--: | :--: | --- | :--: | :--: | :--: |
| **US-11** | Negócio | Função mais crítica apontada pelo cliente: se a ingestão cai, a leitura do período se perde para sempre. | Receber, via MQTT, as leituras publicadas pelas estações, sem alterar o conteúdo recebido. | EPIC-03 | ELEM-73 | RF-18, RNF-02, RNF-06, RNF-11, RNF-12 | 3 | Média | ✅ Finalizado |
| **US-12** | Negócio | Impede que payload malformado, estação desconhecida ou inativa entre no fluxo. | Validar o payload e a situação da estação antes de seguir no fluxo. | EPIC-03 | ELEM-74 | RF-19, RNF-11 | 3 | Média | ✅ Finalizado |
| **US-13** | Negócio | Evita leitura repetida quando o broker reentrega a mensagem (QoS 1). | Ignorar mensagens duplicadas (mesma estação e mesmo timestamp). | EPIC-03 | ELEM-75 | RF-20, RNF-11 | 2 | Média | ✅ Finalizado |
| **US-14** | Negócio | Guarda a leitura bruta antes de qualquer processamento e mantém a estação "Ativa" no painel da US-04. | Gravar a mensagem no staging e atualizar o último sinal da estação. | EPIC-03 | ELEM-76 | RF-21, RNF-11 | 3 | Média | ✅ Finalizado |
| **US-15** | Negócio | Entrega a leitura ao serviço de validação sem perder mensagem se o RabbitMQ cair. | Publicar o evento em `telemetria.bruta` (a própria US cria exchange, fila e DLQ). | EPIC-03 | ELEM-77 | RF-22, RNF-06, RNF-11 | 5 | Média | ✅ Finalizado |
| **US-17** | Negócio | Gera a série histórica calibrada que alimenta alertas, dashboards e relatórios. | Calibrar a leitura e gravar em `medidas`. | EPIC-03 | ELEM-79 | RF-24, RNF-11, RNF-13 | 5 | Média | ✅ Finalizado |
| **US-18** | Negócio | Evita medida associada ao sensor errado. | Tratar leitura de sensor inexistente (vai para a DLQ) ou inativo (ignorada, com log e contador). | EPIC-03 | ELEM-80 | RF-25, RNF-11 | 2 | Média | ✅ Finalizado |
| **US-19** | Negócio | Impede que valor fisicamente impossível entre em dashboards, relatórios e alarmes. | Marcar como inválida a medida com valor fisicamente impossível. | EPIC-03 | ELEM-81 | RF-26, RNF-11 | 2 | Média | ✅ Finalizado |
| **US-20** | Negócio | Cumpre o pedido do cliente de que nenhuma leitura se perca, mesmo com falha do banco. | Tratar falha de gravação e reenviar eventos da DLQ (rota restrita ao administrador). | EPIC-03 | ELEM-82 | RF-13, RF-27, RNF-02, RNF-11 | 5 | Média | ✅ Finalizado |
| **US-22** | Negócio | Para agir antes que a condição se agrave. | Como Gestor Público Municipal, quero que cada medida válida seja comparada às regras ativas do sensor assim que chega, e que um alarme seja registrado quando o limite for ultrapassado. | EPIC-03 | ELEM-137 | RF-05, RF-13, RF-17, RF-26, RNF-05, RNF-09 | 8 | Média | ✅ Finalizado |
| **US-23** | Negócio | Para agir sem precisar estar olhando o sistema. | Como Gestor Público Municipal, quero receber um aviso quando um alarme for disparado numa estação do meu município. | EPIC-03 | ELEM-138 | RF-05, RF-13, RF-22, RNF-05, RNF-09, RNF-12 | 5 | Média | ✅ Finalizado |
| **US-24** | Negócio | Para saber de relance o que está acontecendo e onde. | Como Gestor Público Municipal ou Administrador, quero ver os alarmes do meu município numa tela e um indicador de alarmes abertos em todas as páginas. | EPIC-03 | ELEM-139 | RF-13, RNF-01, RNF-02 | 5 | Média | ✅ Finalizado |

### Sprint 3

| US | Tipo | Valor de Negócio | História | Épico | Ticket | Requisitos | Pontos | Prioridade | Status |
| :--: | :--: | --- | --- | :--: | :--: | --- | :--: | :--: | :--: |
| **US-26** | Negócio | A plataforma passa a trabalhar com dados reais em vez de simulados. | Como Gestor Público Municipal, quero que a estação física envie as leituras dos seus sensores a cada 5 minutos. | EPIC-03 | ELEM-154 | RF-06, RF-07, RF-18, RNF-03, RNF-06, RNF-08 | 5 | Baixa | Pronto (DoR ok) |
| **US-27** | Negócio | Uma queda de rede ou do servidor não apaga leituras. | Como Gestor Público Municipal, quero que a estação guarde as leituras enquanto estiver sem conexão e envie tudo quando a conexão voltar. | EPIC-03 | ELEM-155 | RF-06, RF-18, RNF-05 | 5 | Baixa | Pronto (DoR ok) |
| **US-28** | Negócio | Os avisos são sempre sobre a situação atual. | Como Gestor Público Municipal, quero que leituras reenviadas horas depois sejam gravadas direto no PostgreSQL e entrem no histórico sem gerar alarme sobre algo que já passou. | EPIC-03 | ELEM-156 | RF-05, RF-19, RF-24, RNF-11 | 5 | Baixa | Validação PO |
| **US-29** | Negócio | Ninguém envia dados em nome de uma estação, e uma estação perdida é cancelada sem afetar as outras. | Como Gestor Público Municipal, quero que cada estação tenha acesso próprio ao broker e só consiga publicar no seu tópico. | EPIC-03 | ELEM-157 | RF-18, RNF-06, RNF-08, RNF-12 | 5 | Baixa | Pronto (DoR ok) |
| **US-30** | Negócio | A estação entra em operação sem depender da equipe de desenvolvimento. | Como Gestor Público Municipal, quero um roteiro para instalar, calibrar e testar a estação. | EPIC-03 | ELEM-158 | RF-05, RF-07, RF-16, RF-24, RNF-06 | 8 | Baixa | Pronto (DoR ok) |
| **US-31** | Negócio | O gestor vê as medições ao abrir a tela e leva o mesmo resultado para o Power BI ou o Excel; o time técnico usa a mesma consulta em JSON. | Como Gestor Público Municipal, quero abrir uma tela que já mostra as medições do meu município e baixar o mesmo resultado em CSV. | EPIC-03 | ELEM-159 | RF-05, RF-09, RF-11, RF-13, RF-28, RNF-02, RNF-05 | 5 | Baixa | Validação PO |
| **US-35** | Negócio | É a cara do produto: o que o morador e a Prefeitura realmente veem. | Como Gestor Público Municipal, quero ver em painéis a série histórica, as últimas leituras e o IQAr de cada estação do meu município. | EPIC-03 | ELEM-182 | RF-04, RF-13, RF-15, RF-26, RF-28, RNF-01, RNF-10 | 8 | Baixa | Pronto (DoR ok) |
| **US-36** | Negócio | O site foi revisado de ponta a ponta para todos os perfis, e não só tela por tela. | Como usuário da plataforma (visitante, Munícipe, Pesquisador, Gestor Público ou Administrador), quero percorrer todas as telas do meu perfil com dados reais, sem erro nem tela quebrada. | EPIC-03 | ELEM-183 | RF-08, RF-09, RF-12, RF-13, RF-28, RNF-01, RNF-08 | 8 | Baixa | Pronto (DoR ok) |
| **US-37** | Técnico | Prova que uma leitura vira medida, alarme e aviso sem intervenção manual. | Como membro da equipe Elementares, quero que todos os serviços do backend funcionem juntos, da leitura da estação até a consulta na tela. | EPIC-03 | ELEM-184 | RF-03, RF-05, RF-11, RF-13, RF-14, RF-16, RF-21, RF-28, RNF-02, RNF-05, RNF-06, RNF-09, RNF-11, RNF-13 | 8 | Baixa | Pronto (DoR ok) |
| **US-38** | Técnico | A Prefeitura instala o sistema sem depender da equipe e sabe quanto custa. | Como Gestor Público Municipal, quero receber a documentação de infraestrutura, instalação, licenças, governança e cobertura do sistema. | EPIC-04 | ELEM-185 | RNF-02, RNF-05, RNF-06, RNF-07, RNF-08, RNF-09, RNF-10, RNF-13 | 8 | Baixa | Pronto (DoR ok) |
| **US-39** | Negócio | A estação pode ter sensores além dos 5 tipos fixos no código; sem catálogo, cada grandeza nova exige mudar o código. | Como Administrador, quero cadastrar uma grandeza nova, com unidade e faixa física, sem mudar o sistema, para que qualquer sensor da estação possa ser cadastrado. | EPIC-02 | ELEM-261 | RF-01, RF-16, RF-26 | 8 | Baixa | A fazer |
| **US-40** | Negócio | Toda leitura fica guardada no banco temporário antes de qualquer processamento: se a fila ou o banco definitivo caírem, nada se perde. | Como Gestor Público Municipal, quero que toda leitura recebida seja guardada primeiro num banco temporário (Valkey) e só depois siga para a validação e para o banco definitivo. | EPIC-03 | ELEM-207 | RF-03, RF-18, RF-19, RF-20, RF-21, RF-22, RNF-02, RNF-06, RNF-07, RNF-09, RNF-11, RNF-12, RNF-13 | 8 | Baixa | Pronto (DoR ok) |
| **US-41** | Técnico | É o que o cliente e o professor veem no fim: versão na main com tag, submódulos atualizados e demonstração. | Como equipe Elementares, quero fechar a Sprint 3 com uma versão entregue, publicada e demonstrável. | EPIC-04 | ELEM-262 | RNF-04, RNF-07, RNF-14 | 3 | Baixa | A fazer |
| **US-42** | Negócio | Abre os dados para a cidade com controle: cada perfil tem período e cota, e quem consulta ou baixa dados deixa rastro. | Como Munícipe, quero me cadastrar na plataforma e consultar pela API as leituras e medições do meu município, inclusive com um script automático. | EPIC-01 | ELEM-263 | RF-08, RF-11, RF-12, RF-13, RF-28, RF-29, RNF-02, RNF-05, RNF-12 | 8 | Baixa | A fazer |

### Plataforma, DevOps e Qualidade

Itens de engenharia habilitadora (EPIC-04). Começam numa sprint e continuam nas seguintes, porque documentação, CI, QA, testes, deploy e monitoramento precisam ser verificados a cada entrega.

| US | Tipo | Valor de Negócio | História | Épico | Ticket | Requisitos | Pontos | Prioridade | Status |
| :--: | :--: | --- | --- | :--: | :--: | --- | :--: | :--: | :--: |
| **US-07** | Técnico | Garante que qualquer avaliador, incluindo o cliente, entenda o estado real do projeto sem depender de explicação verbal. | Como membro da equipe Elementares, quero manter a documentação do projeto centralizada, atualizada e vinculada aos tickets do Jira, para garantir que qualquer integrante ou avaliador externo compreenda o estado real do projeto sem depender de explicação verbal. | EPIC-04 | ELEM-58 | RNF-02, RNF-03, RNF-04, RNF-07, RNF-08, RNF-12, RNF-14 | 3\* | Alta | 🔄 Em andamento |
| **US-08** | Técnico | Reduz o tempo de setup e evita divergência de ambiente entre máquinas — o custo de não fazer isso aparece como bug em produção depois. | Como desenvolvedor da equipe Elementares, quero ter os repositórios organizados com estrutura de pastas padronizada e ambiente de desenvolvimento reproduzível, para garantir que qualquer integrante trabalhe sobre a mesma base técnica. | EPIC-04 | ELEM-59 | RNF-01, RNF-03, RNF-06, RNF-09 | 3\* | Alta | ✅ Finalizado |
| **US-09** | Técnico | Garante que uma falha de qualidade seja detectada antes de chegar ao usuário final — sustenta a confiabilidade prometida ao cliente. | Como responsável por QA da equipe Elementares, quero definir processos de validação de qualidade e monitorar continuamente a saúde da API, do banco de dados e da esteira de integração, para identificar problemas antes que cheguem ao usuário final. | EPIC-04 | ELEM-60 | RNF-08, RNF-11 | 3\* | Alta | 🔄 Em andamento |
| **US-10** | Técnico | Garante que nenhuma entrega futura quebre o que já foi validado com o cliente. | Como desenvolvedor da equipe Elementares, quero implementar uma suíte de testes automatizados que cubra a lógica de negócio crítica e a integração entre a API e o banco de dados, para garantir que nenhuma alteração futura quebre funcionalidades já validadas. | EPIC-04 | ELEM-61 | RNF-08 | 3\* | Alta | ✅ Finalizado |
| **US-16** | Técnico | Sem a estação física (só na Sprint 3), é a única forma de gerar dados para testar o fluxo e a carga. | Simulador de estações, em container, com taxa de erro configurável. | EPIC-04 | ELEM-78 | RF-23 | 5 | Média | ✅ Finalizado |
| **US-21** | Técnico | Prova que a recepção de dados, função mais crítica para o cliente, funciona de ponta a ponta. | Como membro da equipe Elementares, quero um teste contínuo que envie leituras simuladas pelo fluxo completo e confira que nenhuma se perde. | EPIC-04 | ELEM-136 | RF-18, RF-20, RF-22, RF-23, RF-27, RNF-05, RNF-06, RNF-08 | 5 | Média | ✅ Finalizado |
| **US-25** | Técnico | Garante que as entregas não quebrem o que já foi validado com o cliente. | Como desenvolvedor da equipe Elementares, quero uma suíte de testes unitários e de integração no backend, para garantir que nenhuma alteração quebre funcionalidades já validadas. | EPIC-04 | ELEM-116 | RF-11, RF-12, RF-14, RF-16, RNF-03, RNF-08 | 3 | Média | 🔄 Em andamento |
| **US-32** | Técnico | Sem homologação e sem deploy seguro, não há onde ensaiar a entrega nem como voltar de uma versão ruim. | Como responsável de DevOps pelo Deploy Automático (CD), quero definir processos, estratégias e tecnologias para o deploy contínuo da aplicação em homologação e produção. | EPIC-04 | ELEM-130 | RF-03, RNF-02, RNF-03, RNF-04, RNF-05, RNF-06, RNF-14 | 3 | Média | 🔄 Em andamento |
| **US-33** | Técnico | Para perceber qualquer parada na recepção de dados antes do usuário e agir rápido. | Como Scrum Master responsável pelo monitoramento (DevOps), quero monitorar a saúde dos serviços, do banco, da mensageria e do servidor. | EPIC-04 | ELEM-125 | RNF-05, RNF-10, RNF-11 | 3 | Média | 🔄 Em andamento |
| **US-34** | Técnico | Nenhum código quebrado chega à develop. | Como desenvolvedor da equipe Elementares, quero que todo Pull Request passe por uma esteira de integração contínua que valide tipagem, lint, testes e build. | EPIC-04 | ELEM-181 | RNF-02, RNF-03, RNF-08 | 3 | Baixa | Pronto (DoR ok) |

> **Pontos:** US-01 a US-06 somam 34 Story Points, consenso de Planning Poker (Fibonacci) — medem valor de negócio. \*Os 3 pontos de US-07 a US-10 são uma estimativa nominal de esforço de engenharia **por sprint** em que houver trabalho ativo, para organização e apontamento de horas, e **não fazem parte** do Planning Poker. **Sprint 2:** estimada por nível de dificuldade (Fibonacci) — 48 pontos nas histórias de negócio e 10 nos itens técnicos (US-16 e US-21); os itens de DevOps (US-25, US-32 e US-33) ficaram sem estimativa. **Sprint 3:** estimativas a definir.

**Épicos:** `EPIC-01` Gestão de Acessos e Perfis de Usuários · `EPIC-02` Inventário Territorial de Estações e Sensores · `EPIC-03` Monitoramento Operacional e Gestão de Alertas · `EPIC-04` Engenharia de Plataforma, DevOps e Qualidade (Técnico).

### 🔍 Spikes, Bugs e Débitos Técnicos

| Código | Tipo | Item | Sprint | Épico | Ticket |
| :--: | :--: | --- | :--: | :--: | :--: |
| SPIKE-01 | Spike | Viabilidade de um simulador de estações IoT, para testar o pipeline de ingestão sem depender de hardware físico. | 1 | EPIC-04 | _a criar_ |
| SPIKE-02 | Spike | Definição do payload de telemetria (grandezas enviadas) e do intervalo de envio das estações. | 1 | EPIC-04 | _a criar_ |
| TECH-DEBT-01 | Item Técnico | Unificação de nomenclatura de schema entre a documentação de arquitetura e as especificações de User Story. | 1 | EPIC-04 | _a criar_ |
| BUGS-S1 | Bug | Caça-bugs na `develop` em 26/09: 58 achados (0 críticos, 11 urgentes, 17 perigosos, 14 de risco pequeno e 16 avisos), consolidados em 43 tickets com prioridade por severidade. | 1 | EPIC-04 | _em abertura_ |
| SPIKE-04 | Spike | Estudar MQTT, base da recepção de dados das estações (US-11). | 2 | EPIC-04 | ELEM-87 |
| SPIKE-05 | Spike | Estudar como simular o envio de dados das estações de forma fiel (US-16). | 2 | EPIC-04 | ELEM-88 |
| — | Spike | Estudo de contrato para apresentar ao cliente. | 2 | EPIC-04 | ELEM-120 |
| SPIKE-06 | Spike | Modelo de manutenção e correção de bugs para a Prefeitura (o pacote de 6 meses já está na Governança). | 3 | EPIC-04 | _a criar_ |

> Os itens com ticket "a criar" ou "em abertura" ainda precisam ser registrados no Jira — esta tabela documenta a existência deles, mas a rastreabilidade completa depende do ticket real.

---

<p align="center"><a href="../README.md">← 🏠 Início</a> | <a href="sprints/sprint-1.md">Sprint 1 →</a></p>
