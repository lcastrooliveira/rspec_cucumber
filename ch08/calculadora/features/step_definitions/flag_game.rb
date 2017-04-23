Dado(/^que o jogador começou a jogar$/) do
  @board = [
    ['_', '_'],
    ['_', '_']
  ]
end

Dado(/^que a bandeira está na posição \((\d+), (\d+)\)$/) do |m, n|
  @flag_coordinates = [m, n]
end

Quando(/^o jogador chega na posição \((\d+), (\d+)\)$/) do |m, n|
  player_found_the_flag = @flag_coordinates == [m, n]
  mark = player_found_the_flag ? 'o' : 'x'
  @board[m.to_i][n.to_i] = mark
end

Então(/^o tabuleiro deve ficar assim:$/) do |expected_board|
  expected_board.diff!(@board)
end
