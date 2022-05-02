require "test_helper"

class ContratoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "contratar servico" do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert trabalhador.save
    servico = Servico.new(nome: 'Jardinagem', descricao: 'Realizo a limpeza de quintais', valor: '150.00', horarioInicio: '2000-01-01 07:30:00 UTC',
                          horarioTermino: '2000-01-01 08:30:00 UTC', data: '2022-12-30', trabalhador_id: trabalhador.id)
    assert servico.save
    cliente = Cliente.new(nome: 'Teste', email: 'cliente@admin.com', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                          bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
    assert cliente.save
    contrato = Contrato.new(servico_id: servico.id, cliente_id: cliente.id)
    assert contrato.save
  end

  test "contratar servico sem cliente" do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert trabalhador.save
    servico = Servico.new(nome: 'Jardinagem', descricao: 'Realizo a limpeza de quintais', valor: '150.00', horarioInicio: '2000-01-01 07:30:00 UTC',
                          horarioTermino: '2000-01-01 08:30:00 UTC', data: '2022-12-30', trabalhador_id: trabalhador.id)
    assert servico.save
    contrato = Contrato.new(servico_id: servico.id)
    assert_not contrato.save
  end

  test "contrato sem servico disponivel" do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert trabalhador.save
    cliente = Cliente.new(nome: 'Teste', email: 'cliente@admin.com', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                          bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
    assert cliente.save
    contrato = Contrato.new(cliente_id: cliente.id)
    assert_not contrato.save
  end
end
