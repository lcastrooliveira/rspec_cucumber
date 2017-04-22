# language: pt

Funcionalidade: background

  # Análogo ao before hook do RSpec
  # O background(pt = Contexto) do Cucumber funciona adicionando steps para
  # todos os
  # cenários definidos na feature em questão.
  Contexto:
    Dado que estou somando 1 + 1

  Cenário:
    E adiciono mais 2 na soma
    Então o resultado deve ser 4

  Cenário:
    E adiciono mais 5 na soma
    Então o resultado deve ser 7

Funcionalidade: Processo de compra

  Contexto:
    Dado que estou logado

  Cenário: compra normal
    Uma compra normal quer dizer comprar qualquer produto do nosso site que não
    seja caneca.

    Quando faço uma compra normal
    Então recebo uma mensagem de sucesso

  Cenário: compra com desconto
    Compra com desconto é quando alguém compra uma ou mais canecas.

    Quando compro uma caneca
    Então recebo um aviso dizendo que ganhei um deconto

  Cenário: sistema da transportadora está fora do ar
    Se o sistema da transportadora estiver fora do ar, então não deve ser
    possível fazer compras.

    Dado que o sistema da transportadora está fora do ar
    Quando tento fazer uma compra normal
    Então recebo uma mensagem de erro
