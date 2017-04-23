# language: pt

# "No cucumber é possível você criar tags para marcar seus cenários e fea-
# tures. Para usar uma tag, basta definir um nome e usar esse nome com “@” na
# frente dele, colocando essa tag na linha anterior da definição de um cenário
# ou feature:"
# Na execução das suas features, as tags servem para duas coisas: para filtrar
# que somente algumas features ou cenários sejam executados e para rodar um
# hook somente para algumas tags.

# cucumber --tags @happy_path só executa cenários marcados com a tag @happy_path
# cucumber --tags ~happy_path só executa cenários sem a tag @happy_path

@tag_1
Funcionalidade: Hello World

  @happy_path
  Cenário: Hello world com sucesso
    Quando rodo meu programa de hello World
    Então ele imprime na tela "hello world"


  Cenário: Hello world sem sucesso
    Dado que meu programa de hello world está com um erro de sintaxe
    Quando eu rodo ele
    Então ele não imprime na tela o texto "hello world"
