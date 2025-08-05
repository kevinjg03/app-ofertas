class CreateListaCompras < ActiveRecord::Migration[8.0]
  def change
    create_table :lista_compras do |t|
      t.string :nombre
      t.datetime :fecha_creacion
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
