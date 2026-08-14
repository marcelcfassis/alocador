# Tips

Técnicas práticas, não conceitos. Os conceitos estão no `PLANO.md`.

## Próxima sessão

1. **Refazer o `covers?` do zero, sem olhar.** É a dívida marcada no diário — foi visto
   pronto, não resolvido.
2. **Escrever os specs dos dois buracos** achados na suíte verde, e vê-los falhar:
   - `days` estoura quando `@end_at` é nulo
   - `overlaps?` estoura quando é **o outro** período que não tem fim
3. **Aí sim consertar.**

Antes de escrever a asserção do `days`, decida o comportamento — não existe resposta certa,
existe a sua:

    period.days   # com fim nulo → nil? zero? estoura de propósito? infinito?

Anote no diário o que escolheu **e por quê**. A escolha é a parte interessante.

## Refazer algo que você já viu pronto

Você vai reconhecer a forma e não conseguir reproduzir. É normal, e é o sinal de que ainda
não estava aprendido — não de que você regrediu.

- Reconstrua do **comportamento**, não da memória do código. Se você diz a regra em
  português, você escreve em Ruby.
- **Olhar o spec é permitido** — ele é a especificação, não a resposta. Olhar o `period.rb`
  do commit anterior, não.
- Truque honesto: apague o método, rode a suíte e escreva olhando só os **nomes dos
  exemplos**. Eles descrevem o comportamento inteiro.
- Não saiu em ~10 minutos? Anote no diário e siga pro próximo item. Uma unidade emperrada
  não pode parar o dia — foi assim que os 13 projetos anteriores morreram.

## Quando a sintaxe (não a lógica) travar

Copie a **forma** de um exemplo que já existe no arquivo e troque os valores. Imitar
estrutura é legítimo, é como todo mundo aprende RSpec. O que não se imita é a resposta.

## Quando travar de verdade

Rode a lista de cinco do `PLANO.md` ("O raciocínio que estamos treinando") antes de pedir a
resposta. Se nenhuma das cinco der um próximo passo, aí o passo era grande demais — e o
problema passa a ser meu.

## Rodar sem banco

A unidade 1 é Ruby puro e o spec não carrega o Rails. Se o `bundle install` travar numa
máquina sem PostgreSQL:

    ruby -r date -r ./app/models/period.rb -e 'p Period.new(Date.new(2026,3,1), Date.new(2026,3,10)).days'
