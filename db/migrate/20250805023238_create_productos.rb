class CreateProductos < ActiveRecord::Migration[8.0]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.string :marca
      t.string :presentacion
      t.text :descripcion
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
