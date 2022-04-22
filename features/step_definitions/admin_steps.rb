Given('o cliente com nome {string}, cpf {string}, email {string} e senha {string} existe') do |nome, cpf, email, senha|
  visit '/clientes/sign_out'
  visit '/clientes/sign_up'
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[password]', :with => senha
  fill_in 'cliente[password_confirmation]', :with => senha
  click_button 'Sign up'
  expect(page).to have_content(nome)
  click_link 'Sair'
end

And('o trabalhador com nome {string}, cpf {string}, profissao {string}, email {string} e senha {string} existe') do |nome, cpf, profissao, email, senha|
  visit '/trabalhadors/sign_out'
  visit '/trabalhadors/sign_up'
  fill_in 'trabalhador[nome]', :with => nome
  fill_in 'trabalhador[cpf]', :with => cpf
  fill_in 'trabalhador[profissao]', :with => profissao
  fill_in 'trabalhador[email]', :with => email
  fill_in 'trabalhador[password]', :with => senha
  fill_in 'trabalhador[password_confirmation]', :with => senha
  click_button 'Sign up'
  expect(page).to have_content(nome)
  click_link 'Sair'
end

And('eu estou na tela de admin com nome {string}, email {string} e senha {string}') do |nome, email, senha|
  visit '/admins/sign_out'
  visit '/admins/sign_up'
  fill_in 'admin[nome]', :with => nome
  fill_in 'admin[email]', :with => email
  fill_in 'admin[password]', :with => senha
  fill_in 'admin[password_confirmation]', :with => senha
  click_button 'Sign up'
  expect(page).to have_content(nome)
end

When('clico em mostrar clientes') do
  click_link 'Mostrar clientes'
end

Then('eu vejo todos os clientes cadastrados') do
  expect(page).to have_current_path(clientes_index_path)
end

When('clico em mostrar trabalhadores') do
  click_link 'Mostrar trabalhadores'
end

Then('eu vejo todos os trabalhadores cadastrados') do
  expect(page).to have_current_path(trabalhadors_index_path)
end

When('clico em excluir o cliente com nome {string}') do |nome|
  expect(page).to have_content(nome)
  click_link 'Deletar'
end

Then('os dados do cliente {string} sao apagados') do |nome|
  expect(page).to have_no_content(nome)
end

When('clico em excluir o trabalhador com nome {string}') do |nome|
  expect(page).to have_content(nome)
  click_link 'Deletar'
end

Then('os dados do trabalhador {string} sao apagados') do |nome|
  expect(page).to have_no_content(nome)
end

When('clico para visualizar minha conta') do
  click_link 'Minha conta'
end

When('clico para excluir minha conta') do
  click_button 'Cancel my account'
end

Then('a mensagem {string} eh exibida') do |mensagem|
  expect(page).to have_content(mensagem)
end

