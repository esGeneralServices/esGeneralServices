require "test_helper"

class TrabalhadorTest < ActiveSupport::TestCase
  test 'trabalhador sem nome' do
    trabalhador = Trabalhador.new(nome: '', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert_not trabalhador.save
  end
  test 'trabalhador valido' do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: 'Pedreiro', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert trabalhador.save
  end
  test 'trabalhador sem profissao' do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: '', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert_not trabalhador.save
  end
end
