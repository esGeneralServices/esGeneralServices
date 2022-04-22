class CreateEndereços < ActiveRecord::Migration[7.0]
  def change
    create_table :endereços do |t|
      t.string :cep
      t.string :cidade
      t.string :bairro
      t.string :logradouro
      t.string :complemento

      t.timestamps
    end
  end
end
