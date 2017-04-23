# language: pt

Funcionalidade: Cadastro na aplicação

  Cenário: cadastro na conta com sucesso
    Ao se criar uma conta, o dono da conta deve receber um email de notificação.

    Quando eu crio uma conta
    Então devo receber um email de notificação
