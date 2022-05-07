require "test_helper"

class TrabalhadorTest < ActiveSupport::TestCase

  def setup
    @trabalhador = Trabalhador.new(nome: 'José da Silva', cpf: '70369935454', profissao: 'Pedreiro',
                                   email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
  end

  test 'trabalhador valido' do
    assert @trabalhador.valid?
  end

  test 'trabalhador sem nome' do
    @trabalhador.nome = " "
    assert_not @trabalhador.valid?
  end

  test 'trabalhador sem profissao' do
    trabalhador = Trabalhador.new(nome: 'Teste', cpf: '70369935454', profissao: '', email: 'trabalhador@email.com', password:'123456', password_confirmation:'123456')
    assert_not trabalhador.save
  end
end
