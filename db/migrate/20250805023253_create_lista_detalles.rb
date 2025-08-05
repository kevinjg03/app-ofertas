class CreateListaDetalles < ActiveRecord::Migration[8.0]
  def change
    create_table :lista_detalles do |t|
      t.integer :cantidad
      t.integer :prioridad
      t.references :lista_compra, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
