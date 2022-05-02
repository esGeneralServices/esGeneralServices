And('o servico com nome {string}, descricao {string}, valor {string}, horario de inicio {string}, horario de termino {string} e data {string} existe') do |nome, descricao, valor, horarioI, horarioT, data|
  click_link 'Cadastrar servicos'
  expect(page).to have_current_path(new_servico_path)
  fill_in 'servico[nome]',:with => nome
  fill_in 'servico[descricao]',:with => descricao
  fill_in 'servico[valor]',:with => valor
  fill_in 'servico[horarioInicio]',:with => horarioI
  fill_in 'servico[horarioTermino]',:with => horarioT
  fill_in 'servico[data]',:with => data
  click_button 'Create Servico'
  expect(page).to have_content(nome)
  click_link 'Voltar'
end

And('o trabalhador com nome {string} esta deslogado') do |nome|
  expect(page).to have_content(nome)
  click_link 'Sair'
end

And('eu estou na pagina para contratar servicos') do
  click_link 'Contratar servicos'
  expect(page).to have_current_path(new_contrato_path)
end

When('eu clico para contratar o servico com nome {string}') do |nome|
  select nome, from: 'Servico'
  click_button 'Create Contrato'
end

Then('eu recebo a confirmacao de que o servico com nome {string} foi contratado') do |nome|
  expect(page).to have_content(nome)
  click_link 'Voltar'
end

And('eu estou na pagina do servico com nome {string} contratado') do |nome|
  expect(page).to have_content(nome)
end

When('eu mudo o servico contratado para {string}') do |servico|
  click_link 'Show this contrato'
  click_link 'Edit this contrato'
  select servico, from: 'Servico'
  click_button 'Update Contrato'
end

Then('eu recebo a confirmacao de que o servico foi editado') do
  expect(page).to have_content('Contrato was successfully updated.')
  click_link 'Voltar'
end

When('eu clico para remover o servico contratado com nome {string}') do |nome|
  click_link 'Show this contrato'
  click_button 'Destroy this contrato'
  expect(page).to have_no_content(nome)
end

Then('eu volto para a pagina inicial') do
  click_link 'Voltar'
end

When('eu clico para contratar um servico') do
  click_button 'Create Contrato'
end

Then('eu vejo uma mensagem informando que nao pode criar contrato sem servico') do
  expect(page).to have_content('Servico must exist')
end

And('eu estou na pagina inicial do cliente {string}') do |nome|
  expect(page).to have_content(nome)
end

When('eu clico para visualizar os servicos contratados') do
  click_link 'Listar servicos contratados'
end

Then('eu vejo uma nova pagina com todos os servicos que contratei') do
  expect(page).to have_current_path('/clientes/' + Cliente.last.id.to_s + '/listagem')
end
