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

---

## 2026-08-17 — nível 1, herança

Fiz: `Rectangle`/`Square` no irb — provou na prática que `Square < Rectangle` mente
(mudar `width` não ajusta `height`, quadrado "quebra"). Depois `ColoredRectangle < Rectangle`
como contraponto honesto, usando `super` pra reaproveitar o `initialize` do pai.
Aplicou o teste sozinho num caso novo: `FixedPeriod < Period` proibindo `end_at` nil —
reconheceu que mente, porque aperta uma regra que o pai permite (contrato quebrado pra
quem confia no `Period` genérico).
Travei em: `Square.new(4,5)` sem `initialize` definido no `Rectangle` — `BasicObject#initialize`
não aceita argumentos; `attr_accessor` só cria os métodos, não preenche valor inicial.
Ficou devendo: testar `extend` na prática (ainda pendente). Composição é o próximo item.

---

## 2026-08-17 — nível 1, extend na prática (pendência fechada)

Fiz: `Robot`/`Team` no irb — `include Greetable` deu método de instância (`Robot.new.hello`
funcionou, `Robot.hello` não); `extend Greetable` deu método de classe (`Team.hello`
funcionou, `Team.new.hello` não). Depois aplicou no domínio: `PeriodFactories` com
`current_month`/`open_ended` via `extend` em `Period`, testou `Period.current_month` e
funcionou.
Percepção do dia (dita pelo próprio): "ficou meio abstrato, mas com prática fixa o
aprendizado" — regra guardada: `include` quando o método usa dados de UMA instância
(`self` com estado preenchido); `extend` quando o método é fábrica/utilitário e não
depende de nenhum objeto já existente.
Ficou devendo: nada pendente do mixin. Próximo: composição.

---

## 2026-08-17 — nível 1, composição

Fiz: reescreveu `FixedPeriod` trocando herança (`< Period`, que mentia) por composição
(`@period = Period.new(...)`), delegando `covers?` e `days`. Testou os dois casos: `nil`
levanta `ArgumentError`, e a delegação funciona pro `Period` interno.
Perguntou sozinho um ponto avançado: "se o Period mudar, não escala pra quem usa?" —
resposta: sim, acoplamento não desaparece, mas fica restrito à interface pública que
você chama, em vez de herdar o objeto inteiro (fragile base class problem evitado).
Explicou o ganho com as próprias palavras: composição deixa escolher o que expor, então
nunca promete o que não pode cumprir — ao contrário da herança que mente e exige remendo.
Ficou devendo: nada. Próximo: duck typing.

---

## 2026-08-18 — nível 1, duck typing (fecha o nível, falta só a PROVA)

Fiz: `SingleDay` do zero, sem parentesco com `Period`, respondendo ao mesmo `covers?(data)`.
Spec vermelho veio pronto (incluindo um caso provando duck typing: `[period, single_day].select
{ |p| p.covers?(hoje) }` funcionando sem checar classe). Escreveu a classe sozinho e foi verde
de primeira. Corrigiu na revisão: `attr_accessor` → `attr_reader` (ninguém de fora deveria
reescrever `date`) e `===` → `==` (usou `===` sem saber a diferença — funcionou por acidente
porque `Date` não redefine `===`, mas o idiomático é `==`; `===` é o que o `case/when` chama
por baixo).
Travei em: banco de teste nunca tinha sido criado (só o de dev existia) — `RAILS_ENV=test
bin/rails db:create` resolveu. Não sabia diferença entre `==` e `===`.
Ficou devendo: nada do nível 1 conceitual. Falta só a **PROVA**: classe nova, com testes,
sem ajuda.

---

## 2026-08-18 — nível 1, tentativa de PROVA (Money) — vista, não resolvida

Fiz: tentou a PROVA sozinho com `Money` (soma, comparação, precisão decimal) e travou
montando o spec — pediu ajuda linha a linha, então **não conta como PROVA limpa**, virou
revisão guiada. Mesmo assim achou e corrigiu bugs reais sozinho a cada rodada: `soma`
somando `Float` com objeto `Money` inteiro (faltava chamar `.money`); `soma` devolvendo
número cru em vez de `Money` novo; `isGreater?` → `greater_than?` (nome estilo Java pro
idiomático Ruby); reconheceu sozinho o padrão "`to_d`/`.present?` não é Ruby puro, precisa
de `require`" de uma sessão anterior.
Travei em: `subject` duplicado no spec (devia ser `let`); comparar `Money` com `Float` direto
no `expect`; `to_d` sem `require "bigdecimal/util"`; `be` vs `eq` de novo (mesmo erro do
`SingleDay`, não fixou ainda); `BigDecimal(valor, 2)` — achou que `2` era "casas decimais",
é "dígitos significativos", ficou travado nisso no fim da sessão.
Fechou verde ainda na mesma sessão: trocou `be`→`eq` e `BigDecimal(x, 2)`→`x.to_d`, os dois
guiados por pergunta, não por resposta pronta. Soube explicar de volta o porquê dos dois
(`eq` compara valor, `be` compara identidade; `to_d` evita ter que adivinhar dígitos).
Ficou devendo: a PROVA continua em aberto — essa tentativa (`Money`) não conta, teve ajuda
demais no meio. **Repetir do zero, numa sessão nova, sem chamar no meio**, é o que falta
pra fechar o nível 1.
