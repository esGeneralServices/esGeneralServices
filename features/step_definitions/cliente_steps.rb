Given('Estou na pagina de cadastrar cliente') do
  visit 'clientes/sign_up'
end

When('eu preencho os dados nome {string} cpf {string} email {string} cep {string} cidade {string} bairro {string} logradouro {string} complemento {string} password {string} confirma password {string}') do |nome, cpf, email, cep, cidade, bairro, logradouro, complemento, pass, pass_conf|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[cep]', :with => cep
  fill_in 'cliente[cidade]', :with => cidade
  fill_in 'cliente[bairro]', :with => bairro
  fill_in 'cliente[logradouro]', :with => logradouro
  fill_in 'cliente[complemento]', :with => complemento
  fill_in 'cliente[password]', :with => pass
  fill_in 'cliente[password_confirmation]', :with => pass_conf
  click_button 'Sign up'
end

Then('vejo que o meu cadastro foi efetuado') do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end

Given('Estou na pagina de cliente') do
  visit 'clientes/sign_up'
end

Given('o cliente de nome {string} cpf {string} email {string} cep {string} cidade {string} bairro {string} logradouro {string} complemento {string} password {string} confirma password {string} existe') do |nome, cpf, email, cep, cidade, bairro, logradouro, complemento, pass, pass_conf|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[cep]', :with => cep
  fill_in 'cliente[cidade]', :with => cidade
  fill_in 'cliente[bairro]', :with => bairro
  fill_in 'cliente[logradouro]', :with => logradouro
  fill_in 'cliente[complemento]', :with => complemento
  fill_in 'cliente[password]', :with => pass
  fill_in 'cliente[password_confirmation]', :with => pass_conf
  click_button 'Sign up'
end

When('eu clico para remover o cliente de nome {string}') do |nome|
  expect(page).to have_content(nome)
  expect(page).to have_current_path('/')
  click_link 'Minha conta'
  click_button 'Cancel my account'
end

Then('vejo que o cliente foi corretamente removido') do
  expect(page).to have_content('Bem vindo ao sistema!')
end


Given('Estou na pagina de login') do
  visit '/clientes/sign_in'
end

When('eu preencho os dados email {string} password {string}') do |email, pass|
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[password]', :with => pass
  click_button 'Log in'

end

Then('vejo uma mensagem de erro') do
  expect(page).to have_content('Invalid Email or password')
end

Then('vejo uma mensagem de erro na tela') do
  expect(page).to have_content("Nome can't be blank")
end