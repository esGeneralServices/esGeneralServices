class AddNomeCpfProfissaoToTrabalhadors < ActiveRecord::Migration[7.0]
  def change
    add_column :trabalhadors, :nome, :string
    add_column :trabalhadors, :cpf, :string
    add_column :trabalhadors, :profissao, :string
  end
end
