Given('o cliente com nome {string}, cpf {string}, email {string} e senha {string} existe') do |string, string2, string3, string4|
  visit '/clientes/sign_out'
  visit '/clientes/sign_up'
  fill_in 'cliente[nome]', :with => string
  fill_in 'cliente[cpf]', :with => string2
  fill_in 'cliente[email]', :with => string3
  fill_in 'cliente[password]', :with => string4
  fill_in 'cliente[password_confirmation]', :with => string4
  click_button 'Sign up'
  expect(page).to have_content(string)
  click_link 'Sair'
end

And('o trabalhador com nome {string}, cpf {string}, profissao {string}, email {string} e senha {string} existe') do |string, string2, string3, string4, string5|
  visit '/trabalhadors/sign_out'
  visit '/trabalhadors/sign_up'
  fill_in 'trabalhador[nome]', :with => string
  fill_in 'trabalhador[cpf]', :with => string2
  fill_in 'trabalhador[profissao]', :with => string3
  fill_in 'trabalhador[email]', :with => string4
  fill_in 'trabalhador[password]', :with => string5
  fill_in 'trabalhador[password_confirmation]', :with => string5
  click_button 'Sign up'
  expect(page).to have_content(string)
  click_link 'Sair'
end

And('eu estou na tela de admin com nome {string}, email {string} e senha {string}') do |string, string2, string3|
  visit '/admins/sign_out'
  visit '/admins/sign_up'
  fill_in 'admin[nome]', :with => string
  fill_in 'admin[email]', :with => string2
  fill_in 'admin[password]', :with => string3
  fill_in 'admin[password_confirmation]', :with => string3
  click_button 'Sign up'
  expect(page).to have_content(string)
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

When('clico em excluir o cliente com nome {string}') do |string|
  expect(page).to have_content(string)
  click_link 'Deletar'
end

Then('os dados do cliente {string} sao apagados') do |string|
  expect(page).to have_no_content(string)
end

When('clico em excluir o trabalhador com nome {string}') do |string|
  expect(page).to have_content(string)
  click_link 'Deletar'
end

Then('os dados do trabalhador {string} sao apagados') do |string|
  expect(page).to have_no_content(string)
end

When('clico para visualizar minha conta') do
  click_link 'Minha conta'
end

When('clico para excluir minha conta') do
  click_button 'Cancel my account'
end

Then('a mensagem {string} eh exibida') do |string|
  expect(page).to have_content(string)
end

