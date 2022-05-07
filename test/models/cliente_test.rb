require "test_helper"

class ClienteTest < ActiveSupport::TestCase

  def setup
    @cliente = Cliente.new(nome: 'Antonio Carlos', email: 'cliente@admin.com', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                           bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
  end

  test 'cliente sem nome' do
    cliente = Cliente.new(nome: '', email: 'cliente@admin.com', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                          bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
    assert_not cliente.save
  end
  test 'cliente valido' do
    cliente = Cliente.new(nome: 'Teste', email: 'cliente@admin.com', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                          bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
    assert cliente.save
  end
  test 'cliente sem email' do
    cliente = Cliente.new(nome: 'Teste', email: '', cpf: '70369935454', cep: '11000-123', cidade: 'Sao Paulo',
                          bairro: 'Alphaville', logradouro: 'Rua 15', complemento: 'casa', password:'123456', password_confirmation:'123456')
    assert_not cliente.save
  end
end
