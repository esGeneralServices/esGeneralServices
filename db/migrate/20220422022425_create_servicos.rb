class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.string :tipo
      t.time :horaInicio
      t.time :horaFinal
      t.text :descricao
      t.string :valor

      t.timestamps
    end
  end
end
