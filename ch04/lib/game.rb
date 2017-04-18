# Game
class Game
  attr_accessor :phase, :output, :score, :ui

  def initialize(ui = nil)
    @phase = :initial
    @ui = ui
  end

  def start
    @phase = :started
  end

  def player_hits_target
    @output = 'Congratulations!'
    @score = 100
  end
end
