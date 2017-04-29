# encoding: UTF-8

require_relative 'cli_ui'

class Game

  def initialize(ui = CliUi.new)
    @ui = ui
    @ended = false
  end

  def start
    @ui.write('Bem-vindo ao jogo da forca!')
  end

  def ended?
    @ended
  end

  def next_step
    @ui.write('Qual o tamanho da palavra a ser sorteada?')
    player_input = @ui.read.strip
    if player_input == 'fim'
      @ended = true
    end
  end
end
