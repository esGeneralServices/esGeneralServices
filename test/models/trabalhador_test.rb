require "test_helper"

class TrabalhadorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'cria um trabalhador valido' do
    trabalhador = Trabalhador.new nomeCompleto: 'Fabio',dataNasc: '12/05/2001', cpf: '12024681441',email: 'fabio@gmail.com'
    assert trabalhador.save
  end

  test 'nao deve criar um trabalhador com nome vazio' do
    trabalhador = Trabalhador.new nomeCompleto:'',dataNasc: '12/05/2001', cpf: '12024681441',email: 'fabio@gmail.com'
    assert_not trabalhador.save
  end

  test 'nao deve criar um trabalhador com cpf invalido' do
    trabalhador = Trabalhador.new nomeCompleto:'Fabio',dataNasc: '12/05/2001', cpf: '11111111111',email: 'fabio@gmail.com'
    assert_not trabalhador.save
  end

  test 'deve deletar um trabalhador existente' do
    trabalhador = Trabalhador.new nomeCompleto: 'Fabio',dataNasc: '12/05/2001', cpf: '12024681441',email: 'fabio@gmail.com'
    trabalhador.save
    assert trabalhador.delete
  end


end
