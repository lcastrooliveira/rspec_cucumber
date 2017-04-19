require 'spec_helper'
require 'deep_thought'

describe DeepThought do
  it 'prints the answer to the ultimate question' do
    # Quando você chama o método
    # as_null_object em um double, ele vai ignorar qualquer mensagem que
    # for enviada para ele, menos as que você mockar explicitamente
    printer = double('printer').as_null_object
    computer = DeepThought.new(printer)

    # programa o objeto printer para verificar se o metodo print sera chamado
    # nesse objeto com o argumento "42" durante o teste
    expect(printer).to receive(:print).with('42')

    computer.print_the_answer
  end
end
