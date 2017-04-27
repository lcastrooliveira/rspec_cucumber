# encoding: UTF-8
Quando(/^começo um novo jogo$/) do
  run_interactive('forca')
end

Então(/^vejo na tela:$/) do |text|
  assert_partial_output(text, all_stdout)
end
