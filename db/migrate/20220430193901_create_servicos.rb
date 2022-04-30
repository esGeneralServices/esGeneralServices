class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.string :nome
      t.text :descricao
      t.string :valor
      t.time :horarioInicio
      t.time :horarioTermino
      t.date :data
      t.references :trabalhador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
