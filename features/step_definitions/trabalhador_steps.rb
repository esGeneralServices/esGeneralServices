Given('Eu estou na pagina de cadastrar novo trabalhador') do
  visit '/trabalhadors/new'
end

When('Eu crio um trabalhador com nomeCompleto {string}, dataNasc {string}, cpf {string}, email {string}') do |string, string2, string3, string4|
  fill_in 'trabalhador[nomeCompleto]',:with => string
  fill_in 'trabalhador[dataNasc]',:with => string2
  fill_in 'trabalhador[cpf]',:with => string3
  fill_in 'trabalhador[email]',:with => string4
  click_button 'Create Trabalhador'
  expect(page).to have_current_path(trabalhadors_path + '/' + Trabalhador.last.id.to_s)
end

Then('Eu vejo uma mensagem que o paciente foi criado com sucesso') do
  expect(page).to have_content('Trabalhador was successfully created.')
end

And('Eu clico em deletar trabalhador') do
  click_button 'Destroy this trabalhador'
end

Then('Eu vejo uma mensagem que o trabalhador foi deletado com sucesso') do
  expect(page).to have_content('Trabalhador was successfully destroyed.')
end

