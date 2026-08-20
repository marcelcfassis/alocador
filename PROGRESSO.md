# Progresso

Marque `[x]` quando **escreveu sozinho**, não quando entendeu a explicação. São coisas
diferentes, e só a primeira conta.

Um conceito volta pra `[ ]` sem culpa se, semanas depois, você não conseguir usar sem
consultar. Isso não é retrocesso — é o checklist funcionando.

**Onde estou:** nível 1 com PROVA adiada (18/08, decisão consciente por pressão de trabalho).
Nível 2 fechado em 20/08: SRP e DIP na prática (`AllocationCalculator`/`AllocationInvoice`),
OCP/LSP/ISP reconhecidos, e a PROVA (`PaymentFeeCalculator`) passou na 3ª tentativa —
sozinho, sem chamada no meio. Próximo: nível 3 (MVC).

---

## Nível 0 — preparação

- [x] 13 projetos abandonados arquivados em `_arquivo/`
- [x] `PLANO.md`, `DIARIO.md`, `PROGRESSO.md` e `NVIM.md` escritos
- [x] projeto criado com `rails new` e **commit zero**
- [x] RSpec instalado e rodando

## Nível 1 — Orientação a objetos na prática

- [x] escrever uma classe Ruby pura: estado no `initialize`, comportamento em métodos
- [x] decidir o que é público e o que é privado — e defender a escolha
- [x] módulo como **namespace**
- [x] módulo como **mixin** (`include`) e a diferença pra `extend`
- [x] herança: quando ela é honesta ("é um") e quando mente
- [x] composição: substituir uma herança por composição e explicar o ganho
- [x] duck typing: dois objetos diferentes atendendo à mesma chamada
- [ ] **PROVA:** escrever uma classe nova do zero, com testes, sem perguntar e sem consultar
      — **adiada em 18/08 por decisão consciente** (pressão real de trabalho, precisa
      mostrar Rails rápido). Não é precedente pra pular PROVA de novo sem motivo do mesmo
      peso — ver `DIARIO.md` de 18/08.

**Unidades:**
- [x] 1 — objeto de valor: período com início, fim e as três perguntas (17/08, 16 exemplos verdes)
      `covers?` refeito do zero e resolvido. Bugs de `days` e `overlaps?` com `nil` corrigidos com spec.

## Nível 2 — SOLID, o básico

- [x] SRP: apontar numa classe sua quantos motivos ela tem pra mudar
- [x] quebrar uma classe que faz duas coisas em duas
- [x] DIP: injetar uma dependência em vez de instanciar dentro
- [x] explicar por que DIP é o que torna o teste possível
- [x] reconhecer OCP, LSP e ISP quando alguém citar
- [x] **PROVA:** refatorar código seu justificando pelo princípio
      — 3ª tentativa (20/08), `PaymentFeeCalculator`: `if/elsif` de dispatch virou hash
      `PAYMENT_METHODS` (string → classe), `fee` virou lookup de uma linha. Sozinho, só
      pesquisou sintaxe, sem pedir a decisão pronta. Justificou OCP certo: `fee` não muda
      quando entra um método de pagamento novo, só o hash. Achou sozinho o fallback
      silencioso do `fetch` com default (typo virava taxa zero sem erro), testou, e trocou
      pro `fetch` sem default — `KeyError` explícito, provado com `raise_error`.

## Nível 3 — MVC e responsabilidade de cada camada

- [ ] descrever o ciclo do request de ponta a ponta, sem consultar
- [ ] rotas: `resources`, aninhamento, member vs collection
- [ ] controller: strong params
- [ ] o que **não** pode estar no controller
- [ ] o que **não** pode estar na view
- [ ] identificar lógica que não pertence a nenhuma das três camadas
- [ ] **PROVA:** um CRUD completo do zero, sem scaffold

## Nível 4 — Validações, callbacks e transactions

- [ ] `belongs_to` / `has_many` / `has_many through`
- [ ] validação (Rails) vs. constraint (banco) — e por que ter as duas
- [ ] validação customizada
- [ ] callbacks e a ordem do ciclo de vida
- [ ] `after_commit` roda **fora** da transação — provar isso num teste
- [ ] transaction: o que causa rollback e o que não causa
- [ ] `update_all` pula callbacks — saber quando isso salva e quando destrói
- [ ] scopes, inclusive scope com argumento
- [ ] ver um N+1 no log e resolver com `includes`
- [ ] **PROVA:** modelar uma regra de negócio nova com validação + teste

## Nível 5 — Testes com RSpec, e qualidade

- [ ] `describe` / `context` / `it` — e nomear bem
- [ ] `let` vs `let!` e a armadilha do lazy
- [ ] FactoryBot: factory, trait, associação
- [ ] spec de model
- [ ] spec de request
- [ ] dizer o que um teste **não** prova
- [ ] RuboCop rodando limpo
- [ ] **PROVA:** escrever o spec **antes** do código e fazer passar
- [ ] *(daqui em diante o spec é seu, a revisão é minha)*

## Nível 6 — Mocks e stubs

- [ ] `double` e `instance_double` — e por que o segundo é melhor
- [ ] `allow` (stub) vs `expect` (mock): a diferença real
- [ ] identificar um teste que passa mockando algo que mudou de verdade
- [ ] WebMock: barrar chamada HTTP real no teste
- [ ] VCR: gravar e reusar resposta
- [ ] **PROVA:** testar código que fala com API externa, sem tocar na rede

## Nível 7 — Ambiente, Docker e credentials

- [ ] o que muda entre `development`, `test` e `production`
- [ ] variável de ambiente vs. credentials — quando cada uma
- [ ] o que nunca pode ir pro git
- [ ] escrever um `Dockerfile` que sobe o app
- [ ] `docker-compose` com app + banco
- [ ] explicar por que o host `db` não resolve fora do container
- [ ] **PROVA:** subir o projeto do zero numa máquina limpa só com o README

## Nível 8 — Filas, mensageria e assíncrono

- [ ] decidir o que sai da requisição e o que fica
- [ ] escrever um job e enfileirar
- [ ] retry e o que acontece quando o job falha
- [ ] **idempotência**: rodar duas vezes sem estragar
- [ ] job agendado
- [ ] produtor/consumidor: publicar evento e reagir a ele
- [ ] **PROVA:** mover um fluxo síncrono pra assíncrono sem perder dado

## Nível 9 — Redis e cache

- [ ] Redis como cache vs. como backing store de fila
- [ ] cache de objeto
- [ ] cache de fragmento na view
- [ ] desenhar uma chave de cache
- [ ] **invalidação** — e por que é a parte difícil
- [ ] **PROVA:** cachear algo caro e provar com número que melhorou

## Nível 10 — Multi-tenancy

- [ ] os três modelos: banco, schema, coluna
- [ ] escolher um e justificar
- [ ] `tenant_id` e escopo
- [ ] os perigos do `default_scope`
- [ ] **escrever o teste que pega vazamento entre tenants**
- [ ] **PROVA:** retrofitar multi-tenancy no projeto que nasceu sem

## Nível 11 — Observabilidade

- [ ] log estruturado
- [ ] o que **nunca** logar
- [ ] capturar erro com contexto útil
- [ ] correlation id atravessando o request
- [ ] **PROVA:** partindo só do log, achar a causa de um erro que eu plantei

## Nível 12 — CI/CD

- [ ] pipeline rodando specs
- [ ] pipeline rodando lint
- [ ] o que trava um merge
- [ ] deploy
- [ ] **PROVA:** abrir um PR que o CI reprova por um motivo que você previu
