# language: pt

Funcionalidade: Adivinhar letra
  Após a palavra do jogo ser sorteada, o jogador pode começar a tentar adivinhar
  as letras da palavra.
  Cada vez que ele acerta uma letra, o jogo mostra para ele em que posição
  dentro da palavra está a letra que ele acertou.
  Cada vez que o jogador erra uma letra, mais uma parte do boneco da forca
  aparece na forca. O jogador pode errar no máximo seis vezes, que correspondem
  às seis partes do boneco:
  cabeça, corpo, braço esquerdo, braço direito, perna esquerda, perna direita.

  Contexto:
    * o jogo tem as possíveis palavras para sortear:
      | número de letras | palavra sorteada |
      | 3                | avo              |

  Cenário: Sucesso ao adivinhar a letra
    Se o jogador adivinhar a letra com sucesso, o jogo mostra uma mensagem de
    sucesso e mostra em que posição está a letra que o jogador adivinhou.

    Dado que comecei um jogo
    E que escolhi que a palavra a ser sorteada deverá ter "3" letras
    Quando tento adivinhar que a palavra tem a letra "a"
    E termino o jogo
    Então o jogo mostra que eu adivinhei uma letra com sucesso
    E o jogo termina com a seguinte mensagem na tela:
    """
    a _ _
    """

  Cenário: Erro ao adivinhar a letra
    Se o jogador errar ao tentar adivinhar a letra, o jogo mostra uma mensagem de
    erro e mostra quais a partes o boneco da forca já perdeu.

    Dado que comecei um jogo
    E que escolhi que a palavra a ser sorteada deverá ter "3" letras
    Quando tento adivinhar que a palavra tem a letra "z"
    E termino o jogo
    Então o jogo mostra que eu errei a adivinhação da letra
    E o jogo termina com a seguinte mensagem na tela:
    """
    O boneco da forca perdeu as seguintes partes do corpo: cabeça
    """

  Cenário: Jogador adivinhar com sucesso duas vezes
    Quanto mais o jogador for acertado, mais o jogo vai mostrando pra ele quais
    as letras ele advinhou.

    Dado que comecei um jogo
    E que escolhi que a palavra a ser sorteada deverá ter "3" letras
    Quando tento adivinhar que a palavra tem a letra "a"
    E tento adivinhar que a palavra tem a letra "v"
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
    """
    a v _
    """

  Cenário: Jogador erra três vezes ao adivinhar a letra
    Quanto mais o jogador for erraando, mais partes do boneco são perdidas.

    Dado que comecei um jogo
    E que escolhi que a palavra a ser sorteada deverá ter "3" letras
    Quando tento adivinhar que a palavra tem a letra "z"
    E tento adivinhar que a palavra tem a letra "y"
    E termino o jogo
    Então o jogo termina com a seguinte mensagem na tela:
    """
    O boneco da forca perdeu as seguintes partes do corpo: cabeça, corpo
    """
