require "test_helper"

class AdminTest < ActiveSupport::TestCase

  def setup
    @admin = Admin.new(nome: 'Administrator', email: 'admin@admin.com', password:'123456', password_confirmation:'123456')
  end

  test 'admin valido' do
    assert @admin.valid?
  end

  test 'admin sem nome' do
    @admin.nome = " "
    assert_not @admin.valid?
  end


  test 'admin sem email ' do
    admin = Admin.new(nome: 'Teste', email: '', password:'123456', password_confirmation:'123456')
    assert_not admin.save
  end
end
