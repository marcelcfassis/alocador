# Diário

Uma entrada por dia de estudo. Curta. Serve pra você **ver** que avançou — foi a falta
disso que matou as tentativas anteriores.

Formato:

    ## AAAA-MM-DD — nível N, unidade X
    Fiz:
    Travei em:
    Ficou devendo:

---

## 2026-08-14 — nível 0 → nível 1

Fiz: arquivei 13 projetos abandonados em `_arquivo/`. Escrevi plano, progresso e diário.
Criei o projeto (Ruby 4.0.1, Rails 8.1), instalei o RSpec e subi o repo público.
Recebi o spec vermelho da unidade 1 (objeto de valor: período).
Travei em: não soube dizer o que `~> 8.1.3` permite — fui pesquisar. Daí saiu a regra das
duas fontes de verdade (ruby-doc e guides.rubyonrails.org).
Ficou devendo: escrever `app/models/period.rb` e deixar o spec verde.

Escrevi o `initialize` e o `covers?` sozinho. Errei três vezes, cada uma ensinando algo:
`return true if` devolve `nil` no caminho falso (`nil` é falsy mas não é `false`); `&&` é
preguiçoso e por isso só um dos dois casos sem fim quebrava; e `.present?` **não é Ruby, é
ActiveSupport** — em Ruby puro é `.nil?`.

⚠️ **`covers?` foi VISTO, não resolvido** — pedi a resposta da guard clause. Refazer do zero,
sem olhar, antes de seguir pro `overlaps?`.

Percepção do dia: trabalho com Sidekiq, Service e Query Object, mas não escrevo uma classe
simples. Reconhecer padrão e ter fluência de linguagem são coisas diferentes — e é a segunda
que falta.

**Fechou verde: 14 exemplos, 0 falhas.** Escritos sozinho: `initialize`, `days`, e o
`overlaps?` inteiro. Mais erros que ensinaram: `attr_reader :x` lê `@x` e o nome tem que
bater letra por letra; duas linhas soltas não se combinam, só a última vira o retorno; e
`||` onde era `&&` faz quase tudo virar `true`.

Achei dois bugs numa suíte verde: `days` e `overlaps?` estouram quando o fim é nulo (o
segundo só quando é o **outro** período que não tem fim). Lição: verde não prova que o
código está certo, prova que o que foi testado funciona.

---

## 2026-08-17 — nível 1, unidade 1 (bugs e covers?)

Fiz: refiz o `covers?` do zero sem olhar — dessa vez resolvido, não visto. Corrigi os dois
bugs do `days` e do `overlaps?` com `end_at` nulo. Escrevi os specs antes de corrigir o
código. 16 exemplos verdes.
Travei em: sintaxe do spec (`be.(nil)`, `eq.(nil)`) — confundi as formas. Subject errado no
context do `#days` — usava o period com fim definido pra testar caso sem fim. Retornei
`false` no `overlaps?` quando `other.end_at` era nulo sem pensar no caso em que ainda
há sobreposição.
Ficou devendo: unidade 2 (a definir).

Percepção do dia: ainda escrevo sem pensar nos outros cenários — coloco o caminho feliz e
esqueço o `nil`. Ler o spec em voz alta antes de rodar tem ajudado a enxergar o que está
escrito de verdade.

---

## 2026-08-17 — nível 1, unidades 2, 3 e 4

Fiz: público vs privado no irb com `Rectangle` e `valid_dimensions?` — entendeu que `private`
esconde comportamento interno, não é punição. Namespace com dois módulos `Allocation` e
`Financial` cada um com `Report`. Mixin com `Nameable` em `Person` e `Client` — percebeu
sozinho que é a origem dos Concerns do Rails. Acertou de primeira a diferença entre
`include` (instância) e `extend` (classe) sem consultar.
Travei em: `unless` vs `if` — inverteu a lógica na primeira tentativa.
Ficou devendo: testar `extend` na prática (ficou pra próxima sessão).
