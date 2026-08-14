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
