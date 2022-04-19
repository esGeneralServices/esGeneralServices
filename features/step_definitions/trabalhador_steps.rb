Given('Eu estou na pagina de cadastrar novo trabalhador') do
  visit '/trabalhadors/new'
end

When('Eu crio um trabalhador com nomeCompleto {string}, dataNasc {string}, cpf {string}, email {string}') do |nomeCompleto, dataNasc, cpf, email|
  fill_in 'trabalhador[nomeCompleto]',:with => nomeCompleto
  fill_in 'trabalhador[dataNasc]',:with => dataNasc
  fill_in 'trabalhador[cpf]',:with => cpf
  fill_in 'trabalhador[email]',:with => email
  click_button 'Create Trabalhador'
  expect(page).to have_current_path(trabalhadors_path + '/' + Trabalhador.last.id.to_s)
end

Then('Eu vejo uma mensagem que o paciente foi criado com sucesso') do
  expect(page).to have_content('Trabalhador was successfully created.')
end

Given('Eu estou na pagina do trabalhador') do
  visit 'trabalhadors'
  expect(page).to have_current_path('/trabalhadors')
end

And('O trabalhador com nomeCompleto {string}, dataNasc {string}, cpf {string}, email {string} existe') do |nomeCompleto, dataNasc, cpf, email|
  visit 'trabalhadors/new'
  fill_in 'trabalhador[nomeCompleto]',:with => nomeCompleto
  fill_in 'trabalhador[dataNasc]',:with => dataNasc
  fill_in 'trabalhador[cpf]',:with => cpf
  fill_in 'trabalhador[email]',:with => email
  click_button 'Create Trabalhador'
  expect(page).to have_content(cpf)
end

When('Eu clico em deletar o trabalhador de cpf {string}') do |cpf|
  expect(page).to have_content(cpf)
  click_button "Destroy this trabalhador"
end

Then('Eu vejo uma mensagem que o trabalhador foi deletado com sucesso') do
  expect(page).to have_content('Trabalhador was successfully destroyed.')
end



