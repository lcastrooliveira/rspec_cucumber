#language: pt
Funcionalidade: Começar o jogo
  Para poder passar o tempo
  Como jogador
  Quero poder começar um novo jogo

  Cenário: Começo de novo jogo com sucessso
    Ao começar o jogo, é mostrada a mensagem inicial para o jogador.
    Quando começo um novo jogo
    Então vejo a seguinte mensagem na tela:
    """
    Bem-Vindo ao jogo da forca!
    """
