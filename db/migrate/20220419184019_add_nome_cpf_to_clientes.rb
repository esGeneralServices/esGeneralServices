class AddNomeCpfToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :nome, :string
    add_column :clientes, :cpf, :string
  end
end
