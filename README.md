# alocador

Projeto de estudo de Ruby on Rails. O domínio é alocação de pessoas em clientes — escolhido
porque produz os problemas certos: período com início e fim, muitos-para-muitos, dinheiro.

O objetivo não é terminar o produto. É **dominar Rails**.

## Os documentos

| Arquivo | Para quê |
|---|---|
| [PLANO.md](PLANO.md) | o contrato, as regras de calibração, os 12 níveis, e o que **não** cobrimos |
| [PROGRESSO.md](PROGRESSO.md) | o checklist — marca só o que escreveu sozinho |
| [DIARIO.md](DIARIO.md) | uma entrada por dia: fiz / travei / ficou devendo |
| [NVIM.md](NVIM.md) | 3 atalhos por semana, sem truque |

## Rodar

    bundle install
    bundle exec rspec

A suíte está **vermelha de propósito**: `spec/models/period_spec.rb` descreve uma classe que
ainda não foi escrita. É a unidade da vez.

Banco ainda não é necessário — o primeiro objeto é Ruby puro, e o spec nem carrega o Rails.

Ruby 4.0.1 · Rails 8.1 · PostgreSQL · RSpec
