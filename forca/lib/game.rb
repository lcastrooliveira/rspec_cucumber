# encoding: UTF-8

require_relative 'cli_ui'
require_relative 'word_raffler'

class Game

  attr_accessor :raffled_word

  def initialize(word_raffler = WordRaffler.new)
    @word_raffler = word_raffler
    @ended = false
  end

  def start
    @ui.write('Bem-vindo ao jogo da forca!')
  end

  def raffle(word_length)
    @raffled_word = @word_raffler.raffle(word_length)
  end

  def ended?
    @ended
  end

  def finish
    @ended = true
  end
end
