require 'spec_helper'

describe '#be matchers' do
  it 'shows eq' do
    expect(1).to eq(1)
    expect(1).not_to eq(2)
    expect(1).to equal(1)
    expect(1).to be(1)
  end

  it 'show truthy and falsy' do
    expect(true).to be_true
    expect(false).to be_false
    expect(false).not_to be_true
    expect(nil).to be_nil
  end
end

describe 'array matchers' do
  array = [1, 2, 3, 4]
  it 'shows #match_array' do
    expect(array).to match_array([1, 2, 3, 4])
    expect(array).to match_array([4, 3, 2, 1])

    expect(array).not_to match_array([1, 2, 3])
    expect(array).not_to match_array([1, 2, 3, 4, 5])
  end
  it 'shows #include' do
    expect(array).to include(1)
    expect(array).to include(1, 2, 3)

    expect(array).not_to include(5, 6, 7, 8)
    expect(array).not_to include([1, 2, 3, 4])
  end
  it 'shows #start_with and #end_with' do
    expect(array).to start_with(1)
    expect(array).to start_with(1, 2)
    expect(array).not_to start_with(2)

    expect(array).to end_with(4)
    expect(array).to end_with(3, 4)
    expect(array).not_to end_with(3)
  end
end

describe 'hash matchers' do
  hash = { a: 7, b: 5 }
  it 'shows #include' do
    # Verifica se tem chaves
    expect(hash).to include(:a)
    expect(hash).to include(:a, :b)
    # Verifica se tem o par chave-valor
    expect(hash).to include(a: 7)
    expect(hash).to include(b: 5, a: 7)

    expect(hash).not_to include(:c)
    expect(hash).not_to include(a: 11)
    expect(hash).not_to include(a: 13, c: 11)
    expect(hash).not_to include(:c, :d)
  end
end

describe 'string matchers' do
  string = 'hugo barauna'
  it '#match (re) matchers' do
    expect(string).to match(/hugo/)
    expect(string).to match(/araun/)

    expect(string).not_to match(/barao/)
    expect(string).not_to match(/hugs/)
  end
  it '#include matchers' do
    expect(string).to include('h')
    expect(string).to include('hugo')
    expect(string).to include('hugo', 'bara')

    expect(string).not_to include('barao')
    expect(string).not_to include('hugs')
  end

  it 'show #start_with and #end_with' do
    expect(string).to start_with('hugo')
    expect(string).not_to start_with('barauna')

    expect(string).to end_with('barauna')
    expect(string).not_to end_with('hugo')
  end
end

describe 'predicate matchers' do
  # metodos gerados atraves de metaprogramacao baseado em convencoes exemplo
  hash = { key: 1 }
  # chama o metodo hash.has_key?(:key)
  it 'shows hash #has_key? predicate matcher' do
    # have_key foi gerado em cima do metodo #has_key? na classe Hash
    expect(hash).to have_key(:key)
  end
end

describe 'exceptions matchers' do
  it 'shows a simple exception spec' do
    # a sintaxe muda, expect recebe um bloco ao inves de argumentos como antes
    # ex: expect { raise }.to raise_error / raise_exception
    expect { raise RuntimeError }.to raise_exception(RuntimeError)
    expect { raise StandardError }.not_to raise_exception(RuntimeError)
    # verificar a msg da exception levantada
    expect { raise 'error message' }.to raise_error('error message')
    expect { raise 'error message' }.not_to raise_error('wrong message')
  end
end

describe 'number matchers' do
  it 'simple matchers' do
    expect(7).to eq 7
    expect(7).to be < 10
    expect(7).to be > 1
    expect(7).to be <= 7
    expect(7).to be >= 7
  end
  it '#be_within to float numbers' do
    # expect(actual).to be_within(delta).of(expected)
    # (expected - delta) <= actual <= (expected + delta)
    expect(Math::PI).to be_within(0.01).of(3.14)
  end
end

describe 'range matchers' do
  range = (1..10)
  it 'shows #cover for ranges' do
    expect(range).to cover(1)
    expect(range).to cover(10)
    expect(range).to cover(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    # ordem nao eh necessaria
    expect(range).to cover(1, 6, 9, 8)
  end
end

describe 'instanceof matchers' do
  it 'show #be_an_instance_of and #be_a_kind_of matchers' do
    # be_an_instance_of verifica se o objeto é uma instância da classe dada
    expect(5).to be_an_instance_of(Fixnum)
    expect(5).not_to be_an_instance_of(Numeric)
    expect(5).not_to be_an_instance_of(String)

    # be_a_kind_of verifica se o objeto é uma instância da classe
    # dada ou de uma subclasse da classe dada
    expect(5).to be_a_kind_of(Fixnum)
    expect(5).to be_a_kind_of(Numeric)
    expect(5).to be_a_kind_of(Object)
    expect(5).not_to be_a_kind_of(String)
  end
end

describe 'have matchers' do
  collection = [1, 2, 3, 4, 5]
  it 'shows #have_at_least and #have_at_most' do
    expect(collection).to have_at_least(3).elements
    expect(collection).to have_at_most(5).elements
  end
end

describe 'state/value change' do
  class Game
    attr_reader :state
    def initialize
      @state = :initial
    end
    def start
      @state = :started
    end
  end
  it 'changes the game state from :initial to :started' do
    # o Change Matcher pode ser usado
    # quando voce quer verificar que a execucao de um bloco de codigo causa uma
    # mudanca de estado de um objeto.
    game = Game.new
    expect do
      game.start
    end.to change { game.state }.from(:initial).to(:started)
  end
  # Pense nesse tipo de matcher como um verificador que analisará o valor
  # antes e depois de alguma ação.
end
