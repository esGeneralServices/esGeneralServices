Given('Eu estou na pagina de cadastrar novo trabalhador') do
  visit '/trabalhadors/sign_up'
end

When('Eu crio um trabalhador com nome {string}, cpf {string}, profissao {string}, email {string}, password {string}, password_confirmation {string}') do |nome, cpf, profissao, email, password, password_confirmation |
  fill_in 'trabalhador[nome]',:with => nome
  fill_in 'trabalhador[cpf]',:with => cpf
  fill_in 'trabalhador[profissao]',:with => profissao
  fill_in 'trabalhador[email]',:with => email
  fill_in 'trabalhador[password]',:with => password
  fill_in 'trabalhador[password_confirmation]',:with => password_confirmation
  click_button 'Sign up'
end

Then('Eu vejo uma mensagem que o trabalhador {string} foi gerado') do |nome|
  expect(page).to have_content(nome)
end

Given('Eu estou na pagina de trabalhador') do
  visit '/trabalhadors/'
end

Given('O trabalhador com nome {string}, cpf {string}, profissao {string}, email {string}, password {string}, password_confirmation {string} existe') do |nome, cpf, profissao, email, password, password_confirmation|
  visit '/trabalhadors/sign_up'
  fill_in 'trabalhador[nome]',:with => nome
  fill_in 'trabalhador[cpf]',:with => cpf
  fill_in 'trabalhador[profissao]',:with => profissao
  fill_in 'trabalhador[email]',:with => email
  fill_in 'trabalhador[password]',:with => password
  fill_in 'trabalhador[password_confirmation]',:with => password_confirmation
  click_button 'Sign up'
  expect(page).to have_content(nome)
end

When('Eu clico para cancelar minha conta') do
  click_link 'Minha conta'
  expect(page).to have_content('Edit Trabalhador')
  click_button 'Cancel my account'
end

Then('Eu vejo uma mensagem que o trablhador foi excluido') do
  expect(page).to have_content('Bye! Your account has been successfully cancelled. We hope to see you again soon.')
end

Then('Eu vejo uma mensagem de erro') do
  expect(page).to have_content('Cpf Formato: XXX.XXX.XXX-XX')
end

Given('Eu estou na pagina home') do
  visit 'http://127.0.0.1:3000/'
end

When('Eu clico para editar minha conta com nome {string}') do |nome|
  expect(page).to have_content(nome)
  click_link 'Minha conta'
end

When('Altero o nome para {string} com a senha {string}') do |nomenovo, senha|
  fill_in 'trabalhador[nome]',:with => nomenovo
  fill_in 'trabalhador[current_password]', :with => senha
  click_button 'Update'
  expect(page).to have_content(nomenovo)
end


Then('Eu vejo uma mensagem de cadastro atualizado') do
  expect(page).to have_content('Your account has been updated successfully.')
end

When('Altero o email para {string} com a senha {string}') do |emailnovo, senha|
  fill_in 'trabalhador[email]',:with => emailnovo
  fill_in 'trabalhador[current_password]', :with => senha
  click_button 'Update'
end

