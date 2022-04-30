require "test_helper"

class AdminTest < ActiveSupport::TestCase
  test 'admin sem nome' do
    admin = Admin.new(nome: '', email: 'admin@admin.com', password:'123456', password_confirmation:'123456')
    assert_not admin.save
  end
  test 'admin valido' do
    admin = Admin.new(nome: 'Teste', email: 'admin@admin.com', password:'123456', password_confirmation:'123456')
    assert admin.save
  end

  test 'admin sem email ' do
    admin = Admin.new(nome: 'Teste', email: '', password:'123456', password_confirmation:'123456')
    assert_not admin.save
  end
end
