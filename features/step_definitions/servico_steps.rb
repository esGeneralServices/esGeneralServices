Given('Eu estou na tela de cadastrar um novo servico') do
  visit '/servicos/new'
end

When('Eu crio um servico com nome {string}, descricao {string}, valor {string}, horarioInicio {string}, horarioTermino {string}, data {string}') do |nome, descricao, valor, horarioInicio, horarioTermino, data|
  fill_in 'servico[nome]',:with => nome
  fill_in 'servico[descricao]',:with => descricao
  fill_in 'servico[valor]',:with => valor
  fill_in 'servico[horarioInicio]',:with => horarioInicio
  fill_in 'servico[horarioTermino]',:with => horarioTermino
  fill_in 'servico[data]',:with => data
  click_button 'Create Servico'
end

Then('Eu vejo uma mensagem que o serviço de nome {string} foi criado') do |nome|
  expect(page).to have_content(nome)
end

Then('Eu vejo uma mensagem de erro de nome vazio') do
  expect(page).to have_content("Nome can't be blank")
end
