class AddCepCidadeBairroLogradouroComplementoToClientes < ActiveRecord::Migration[7.0]
  def change
    add_column :clientes, :cep, :string
    add_column :clientes, :cidade, :string
    add_column :clientes, :bairro, :string
    add_column :clientes, :logradouro, :string
    add_column :clientes, :complemento, :string
  end
end
