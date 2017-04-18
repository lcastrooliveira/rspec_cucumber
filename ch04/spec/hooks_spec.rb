require 'spec_helper'
require 'game'
require 'database'
require 'twitter_ui'
require 'blog_post'
require 'paper'
require 'publishable'
require 'publishable_object'

describe Game, 'in the final phase' do
  before do
    @game = Game.new
    @game.phase = :final
  end

  context 'when the player hits the target' do
    it 'congratulates the player' do
      @game.player_hits_target
      expect(@game.output).to eq('Congratulations!')
    end

    it 'sets the score to 100' do
      @game.player_hits_target
      expect(@game.score).to eq(100)
    end
  end
end

describe 'An around hook example' do
  around do |example|
    puts 'Before the example'
    example.run
    puts 'After the example'
  end

  it do
    puts 'Inside the example'
  end
end

describe Database do
  around do |example|
    puts 'Before transaction'
    Database.transaction(&example)
    puts 'After transaction'
  end

  it 'run the example as a proc' do
    puts 'Saving a lot of data in the DB'
  end
end

describe Array, 'with some elements' do
  subject(:array) { [1, 2, 3] }
  it 'should have the prescribed elements' do
    expect(array).to eq [1, 2, 3]
  end
end

describe Game do
  before do
    @game = Game.new
  end
  let(:ui) { TwitterUi.new('sandbox_username', 'sandbox_password') }
  it 'congratulates the player when the player hits the target' do
    @game.ui = ui
    @game.player_hits_target
    expect(@game.output).to include('Congratulations!')
  end
end

describe 'The lazy-evaluated behaviour of let' do
  before { @foo = 'bar' }
  let(:broken_operation) { raise "I'm broken" }
  subject(:broken) { raise "I'm broken too" }

  it 'will call the method defined by let' do
    expect {
      expect(@foo).to eq('bar')
      broken_operation
    }.to raise_error("I'm broken")
  end

  it 'will as defined by subject' do
    expect {
      expect(@foo).to eq('bar')
      broken
    }.to raise_error("I'm broken too")
  end

  it 'will not call the method defined by let neither subject' do
    expect {
      expect(@foo).to eq('bar')
    }.to_not raise_error("I'm broken")
  end
end

describe Game do
  subject(:game) { Game.new(ui) }
  let(:ui) { TwitterUi.new('sandbox_username', 'sandbox_password') }

  it 'congratulates the player when the player hits the target' do
    game.player_hits_target

    expect(game.output).to include('Congratulations!')
  end
end

shared_examples_for 'a published object' do
  describe '#publish!' do
    it 'saves the publication date' do
      subject.publish!

      today = Time.now.strftime('%Y-%m-%d')
      expect(subject.published_on).to eq(today)
    end
  end
end

# "Perceba que, ao usar o it_behaves_like , ele coloca o output dos
# shared examples aninhado com a frase behaves like a publishable object, difer-
# entemente de quando usamos o método include_examples , que colocou
# o output dos shared examples diretamente, sem mostrar que eles são shared
# examples."

describe 'A published object' do
  subject { PublishableObject.new }
  include_examples 'a published object'
end

describe BlogPost do
  it_behaves_like 'a published object'
end

describe Paper do
  it_behaves_like 'a published object'
end

# Lembre-se
# describe BlogPost do
# end

# eh equivalente a
# describe BlogPost do
#   subject { BlogPost.new }
# end
