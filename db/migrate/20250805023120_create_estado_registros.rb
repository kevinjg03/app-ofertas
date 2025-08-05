class CreateEstadoRegistros < ActiveRecord::Migration[8.0]
  def change
    create_table :estado_registros do |t|
      t.string :name

      t.timestamps
    end
  end
end
