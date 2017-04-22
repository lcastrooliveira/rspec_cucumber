# language: pt

# "Repare como é simples reduzir a repetição utilizando a sintaxe de scenario
# outline do Gherkin. Essa sintaxe é composta por três partes: Esquema do
# cenário, placeholders e Exemplos."

Funcionalidade: Soma
  Esquema do Cenário: Soma de dois números
    Quando somo <a> + <b>
    Então o resultado deve ser <resultado>

    Exemplos:
      | a | b | resultado |
      | 1 | 1 | 2         |
      | 2 | 3 | 5         |
      | 4 | 5 | 7         |

Funcionalidade: Desconto
  Esquema do Cenário: Cálculo de desconto de produto
    O desconto de produtos da nossa loja são baseados em até três variáveis:
    tipo de produto, preço do produto e quantidade em estoque.

    Dado que um <produto> tem um estoque de <estoque> unidades
    E que esse produto custa <preco> em reais
    Então o desconto desse produto deve ser de <desconto> reais

    Exemplos: Desconto para eletrodomésticos
      Um eletrodoméstico deve ter um desconto de 20 reais caso tenha mais de 100
      unidades em estoque e seu preço seja maior que 100 reais.

      | produto   | estoque | preco | desconto |
      | geladeira | 90      | 200   | 0        |
      | geladeira | 150     | 200   | 20       |
      | fogão     | 150     | 70    | 0        |

    Exemplos: Desconto para alimentos
      Um alimento deve ter desconto de 1 real caso tenha mais de 1000 unidades
      em estoque.

      | produto   | estoque | preco | desconto |
      | arroz     | 900     | 5     | 0        |
      | feijão    | 1500    | 3     | 1        |
