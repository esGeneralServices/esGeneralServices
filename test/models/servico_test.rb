require "test_helper"

class ServicoTest < ActiveSupport::TestCase
  test 'servico valido' do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert trabalhador.save
    servico = Servico.new(nome: 'Jardinagem', descricao: 'Realizo a limpeza de quintais', valor: '150.00', horarioInicio: '2000-01-01 07:30:00 UTC',
                          horarioTermino: '2000-01-01 08:30:00 UTC', data: '2022-12-30', trabalhador_id: trabalhador.id)
    assert servico.save
  end

  test 'servico sem trabalhador' do
    servico = Servico.new(nome: 'Jardinagem', descricao: 'Realizo a limpeza de quintais', valor: '150.00', horarioInicio: '2000-01-01 07:30:00 UTC',
                          horarioTermino: '2000-01-01 08:30:00 UTC', data: '2022-12-30')
    assert_not servico.save
  end

  test 'servico sem descricao' do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert trabalhador.save
    servico = Servico.new(nome: 'Jardinagem', descricao: '', valor: '150.00', horarioInicio: '2000-01-01 07:30:00 UTC',
                          horarioTermino: '2000-01-01 08:30:00 UTC', data: '2022-12-30', trabalhador_id: trabalhador.id)
    assert_not servico.save
  end

  # test "the truth" do
  #   assert true
  # end
end
