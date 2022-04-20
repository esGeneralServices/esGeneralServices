Given('Estou na pagina de cadastrar cliente') do
  visit 'clientes/sign_up'
end

When('eu preencho os dados nome {string} cpf {string} email {string} password {string} confirma password {string}') do |nome, cpf, email, pass, pass_conf|
  fill_in 'cliente[nome]', :with => nome
  fill_in 'cliente[cpf]', :with => cpf
  fill_in 'cliente[email]', :with => email
  fill_in 'cliente[password]', :with => pass
  fill_in 'cliente[password_confirmation]', :with => pass_conf
  click_button 'Sign up'
end

Then('vejo que o meu cadastro foi efetuado') do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end