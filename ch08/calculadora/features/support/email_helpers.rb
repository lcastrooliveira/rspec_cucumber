# "O support code deve conter a lógica necessária para interagir com o SUT.
# Do ponto de vista dos step definitions, ele é uma espécie de DSL da nossa
# aplicação. Ou seja, as ações que podem ser realizadas na nossa aplicação são
# “descritas” pelo support code, de modo que os step definitions possam utilizar
# essas descrições para executar ações no nosso sistema."

module EmailHelpers
  def last_sent_email
    sent_emails = ActionMailer::Base.deliveries
    sent_emails.last
  end
end

# Injeta o modulo no cucumber para que ele possa ser usado nas step definitions
World(EmailHelpers)
