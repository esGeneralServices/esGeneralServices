class CreateServicos < ActiveRecord::Migration[7.0]
  def change
    create_table :servicos do |t|
      t.string :nomeServico
      t.string :tipoServico
      t.date :dataServico
      t.time :horaInicio
      t.time :horaFinal
      t.text :descricaoServico
      t.string :valorServico
      t.references :endereco, null: false, foreign_key: true

      t.timestamps
    end
  end
end
