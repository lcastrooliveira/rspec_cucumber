# language: pt

Funcionalidade: Data table

  Cenário: Demonstrar o uso de data tables do cucumber para tabelar informações

    Dado que tenho um cadastro de usuário com os seguintes attributos:
      | nome           | idade |
      | Lucas Oliveira | 26    |

    # "Ao executarmos o step acima, a tabela de dados definida será passada
    # como um array de arrays para a step definition"

  Cenário: multiplicação de matrizes
    Dado que tenho a matriz A:
      | 1 | 2 |
      | 3 | 4 |
    E tenho a matriz B:
      | 5 | 6 |
      | 7 | 8 |
    Quando multiplico a matriz A com a matriz B
    Então o resultado é:
      | 19 | 22 |
      | 43 | 50 |
