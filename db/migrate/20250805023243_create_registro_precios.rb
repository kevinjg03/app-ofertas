class CreateRegistroPrecios < ActiveRecord::Migration[8.0]
  def change
    create_table :registro_precios do |t|
      t.decimal :precio
      t.string :moneda
      t.datetime :fecha_registro
      t.string :foto_ticket_url
      t.float :latitud
      t.float :longitud
      t.boolean :es_atipico
      t.references :estado_registro, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true
      t.references :comercio, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
