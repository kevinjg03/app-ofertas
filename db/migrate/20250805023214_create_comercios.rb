class CreateComercios < ActiveRecord::Migration[8.0]
  def change
    create_table :comercios do |t|
      t.string :nombre
      t.string :direccion
      t.float :latitud
      t.float :longitud

      t.timestamps
    end
  end
end
