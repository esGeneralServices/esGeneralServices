require "test_helper"

class ClienteTest < ActiveSupport::TestCase

  def setup
    @cliente = Cliente.new(nome: 'Antonio Carlos', email: 'cliente@admin.com', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                           bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
  end

  test 'cliente valido' do
    assert @cliente.valid?
  end

  test 'cliente sem nome' do
    @cliente.nome = " "
    assert_not @cliente.valid?
  end

  test 'cliente sem email' do
    @cliente.email = " "
    assert_not @cliente.valid?
  end
end
