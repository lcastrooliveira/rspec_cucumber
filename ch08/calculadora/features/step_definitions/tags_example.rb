Quando(/^rodo meu programa de hello World$/) do
  puts '[QUANDO] dentro do step definition'
end

Então(/^ele imprime na tela "(.*?)"$/) do |message|
  puts "[ENTAO] #{message}"
end
