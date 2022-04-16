class CreateTrabalhadors < ActiveRecord::Migration[7.0]
  def change
    create_table :trabalhadors do |t|
      t.string :nomeCompleto
      t.date :dataNasc
      t.string :cpf
      t.string :email

      t.timestamps
    end
  end
end
