Então(/^ele recebe um email com o seguinte texto:$/) do |email_body|
  expect(last_email.body).to eq(email_body)
end
