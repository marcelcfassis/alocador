# Ruby on Rails — a fundação

Objetivo: **dominar Ruby on Rails**. Não "entender o SEAT", não decorar truque.
Dirigir o carro com segurança — freio, marcha, retrovisor. Cavalo de pau fica de fora.

O padrão é **Rails idiomático**: o Rails Guides e o jeito que a comunidade faz. Código de
repositório de trabalho não é referência de estilo.

---

## O contrato

1. **Um repositório só, pra sempre.** Nunca mais `rails new`. Vontade de recomeçar é sinal
   de pedir ajuda, não de abrir pasta nova.
2. **Git desde o commit zero.** Commit todo dia, mesmo quebrado, mesmo feio.
3. **O Claude nunca escreve código de produção.** Se você pedir o código pronto, ele mostra —
   e essa unidade fica marcada no diário como *vista*, não resolvida.
4. **Toda unidade tem juiz objetivo:** um spec que fica verde, uma query que some do log.
   Nunca "acho que entendi".
5. **O currículo não é escrito de antemão.** Existe este mapa e a unidade da vez.
6. **Não se avança de nível sem passar na prova.**

**A prova de cada nível:** fazer uma tarefa nova daquele nível, sozinho, numa sessão, sem
perguntar e sem consultar a documentação da API. Precisou consultar? O nível não fechou — e
isso é informação, não fracasso.

**Calibração — regra, não cortesia.** Marcel tem pouquíssimo tempo de código escrito.
"Entendi" nunca conta como aprendido; só escrever sozinho conta. Então:

- Nunca presumir que ele sabe algo por já ter aparecido na conversa ou no trabalho.
- Toda unidade começa com uma **previsão** dele antes de rodar qualquer coisa. Errar a
  previsão é o momento de maior aprendizado da sessão — é o que revela o que ele achava
  que sabia.
- Se ele travar duas vezes seguidas no mesmo ponto, **o passo era grande demais**: dividir,
  não repetir a explicação.
- Perguntar "qual parte disso você não escreveria sozinho agora?" vale mais que
  "ficou claro?".
- **Resposta curta por padrão.** O *porquê* primeiro, em poucas linhas; o *como* só depois
  que o porquê estiver de pé. Explicação longa só quando ele pedir.

**As duas fontes de verdade.** Quando não souber, consulta **estas** — não IA, não Google,
não Stack Overflow:

    Ruby   → https://www.ruby-lang.org/en/documentation/   (oficial; a Core API fica um clique dentro)
    Rails  → https://guides.rubyonrails.org/               (conceito, o porquê)
    Rails  → https://api.rubyonrails.org/                  (método, assinatura, retorno)

Cuidado com a versão: o Google costuma cair em Guides antigos. O projeto está em Rails 8.1.

Consultar é permitido e **registrado no diário**. Não é vergonha — é o sinal de que aquele
nível ainda não fechou.

---

## O raciocínio que estamos treinando

Isto vale mais que qualquer conceito da lista. Não é sobre Ruby — é sobre como se ataca um
problema que você não sabe resolver.

1. **Ler o erro literalmente.** A mensagem nomeia o que falta. `uninitialized constant Date`
   é um `require` faltando, não um bug de lógica. Antes de teorizar, leia o que está escrito.
2. **Muitas falhas com a mesma mensagem = uma causa.** 14 exemplos quebrados quase nunca são
   14 bugs; são um só, antes de todos.
3. **O erro mudar já é progresso.** O sinal de que você avançou não é ficar verde — é a
   mensagem passar a ser outra.
4. **Atacar o mais fácil primeiro.** A ordem é por dependência, não pela posição no arquivo.
   Um método que não precisa do conceito que te travou vem antes.
5. **Isolar antes de escrever.** Dúvida pontual se testa sozinha no `irb`. Descobrir dentro
   de um método que já tem outros dois problemas é debugar duas coisas ao mesmo tempo.

## Repetição da mesma forma, não variedade (14/08/2026)

Escrever do zero é habilidade diferente de modificar código existente. No trabalho sempre há
uma forma pra imitar; na folha em branco não há. É a folha em branco que falta treinar.

Por isso as unidades de um mesmo nível são **deliberadamente parecidas** — mesma estrutura,
mesmo laço, domínios diferentes. A forma tem que virar automática antes de mudar de forma.
Variedade cedo demais parece progresso e não fixa nada.

E o método é este: quebrar a cabeça primeiro, resposta só se ele pedir, e a unidade fica
marcada como *vista* quando isso acontece.

## O laço de cada unidade (1 sessão, 1–2h)

1. **O problema**, dito como comportamento — nunca como tarefa.
2. **O conceito**, com nome, e onde ele mora no ciclo do request.
3. **O mapa**: quais arquivos, em que ordem, de que cada um é responsável. Sem código.
4. **O juiz**: nos níveis 1–5 o spec vermelho vem pronto; do 5 em diante o spec é seu.
5. **Você escreve.**
6. **Revisão** — o que está errado e por quê, sem escrever por você.
7. **A sabotagem**: quebrar algo específico de propósito e achar pelo log/console.
   É aqui que se aprende a debugar.
8. **O jeito canônico**: como o Rails espera que isso seja feito, e onde o seu divergiu.

---

## Os níveis

A ordem é de dependência: cada um só faz sentido depois do anterior.

| # | Nível | Estado |
|---|---|---|
| 1 | Orientação a objetos na prática | ⬜ |
| 2 | SOLID, o básico | ⬜ |
| 3 | MVC e responsabilidade de cada camada | ⬜ |
| 4 | Validações, callbacks e transactions | ⬜ |
| 5 | Testes com RSpec, e qualidade | ⬜ |
| 6 | Mocks e stubs | ⬜ |
| 7 | Ambiente, Docker e credentials | ⬜ |
| 8 | Filas, mensageria e processamento assíncrono | ⬜ |
| 9 | Redis e cache | ⬜ |
| 10 | Multi-tenancy | ⬜ |
| 11 | Observabilidade | ⬜ |
| 12 | CI/CD | ⬜ |

**1. Orientação a objetos na prática** — Classe, estado, comportamento. Público vs. privado e
por que isso importa. Módulo como namespace e como mixin (`include`/`extend`). Herança vs.
composição: quando cada uma, e por que composição costuma ganhar. Duck typing.

**2. SOLID, o básico** — Só o que muda código no dia a dia: **SRP** (quantos motivos esta
classe tem pra mudar?) e **DIP** (dependa da abstração, não do concreto — é o que torna teste
possível). Os outros três: reconhecer quando alguém citar.

**A partir daqui, exemplo é sempre do domínio do projeto** (`Client`, `Person`, `Team`,
`Allocation`, `Payment`), nunca abstrato tipo `Rectangle`/`Cachorro`. Decisão de 18/08: o
foco é ficar Pleno em Rails — Ruby puro serve de base, não é o objetivo em si. Nível 1
(OO em Ruby puro) foi necessário porque os projetos anteriores falharam por falta dele; a
partir do nível 2, quanto mais cedo o exercício parecer código Rails de verdade, melhor.

**3. MVC e responsabilidade de cada camada** — O ciclo do request de ponta a ponta. O que é
responsabilidade de model, controller e view — e principalmente **o que não é de nenhum dos
três**. Rotas, strong params, fat model/skinny controller e o limite disso.

**4. Validações, callbacks e transactions** — Associations. **Validação (Rails) vs. constraint
(banco)**. Callbacks e ciclo de vida, com foco em `after_commit` rodando **fora** da
transação. Transactions: o que faz rollback e o que não faz. Scopes. N+1: ver no log e
resolver.

**5. Testes com RSpec, e qualidade** — Estrutura, `let` vs `let!` e a armadilha do lazy.
FactoryBot. Specs de model e de request. A pergunta que importa: **o que este teste prova e o
que ele não prova.** RuboCop. *Daqui em diante o spec é seu.*

**6. Mocks e stubs** — `double`, `instance_double`, `allow` vs `expect`. **Quando mockar é
mentir**: o teste passa e o código quebra em produção. WebMock/VCR para API externa.

**7. Ambiente, Docker e credentials** — `development`/`test`/`production`. Credentials e
secrets: o que nunca vai pro git. Dockerfile, `docker-compose`, serviços.

**8. Filas, mensageria e processamento assíncrono** — Por que tirar trabalho da requisição.
Job, fila, retry, **idempotência**. Jobs agendados. Produtor/consumidor.

**9. Redis e cache** — Cache de objeto e de fragmento. Chave de cache e **invalidação**, que é
a parte difícil. Redis como cache vs. como backing store de fila.

**10. Multi-tenancy** — Os três modelos (banco, schema, coluna). `tenant_id` + escopo, e o
perigo do `default_scope`. **Vazamento entre tenants e o teste que pega isso.** Você vai
*retrofitar* num app que nasceu sem — que é como acontece na vida.

**11. Observabilidade** — Log estruturado: o que logar e o que **nunca** logar. Erros.
Correlation id.

**12. CI/CD** — Pipeline que roda specs e lint, o que trava um merge, e o deploy.

---

## O que este plano deliberadamente NÃO cobre

Não porque não importa — porque é cavalo de pau:

Views SQL · `EXPLAIN`, tuning de índice, SQL cru · Hotwire/Turbo/Stimulus a fundo ·
ViewComponent · metaprogramação · benchmark e performance · infra além do básico.

Se aparecer no trabalho, a gente olha **naquele momento e só o necessário**.

---

## O projeto

Um sistema de **alocação de pessoas em clientes**. O domínio foi escolhido porque produz os
problemas certos: período com data de início e fim, muitos-para-muitos, dinheiro.

`Client` · `Person` · `Team` · `Allocation` (pessoa × time × **período** × valores) ·
`Payment` · `User`

Ruby 4.0.1, Rails 8.1, PostgreSQL, RSpec.
