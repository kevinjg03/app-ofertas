class CreatePreferencia < ActiveRecord::Migration[8.0]
  def change
    create_table :preferencia do |t|
      t.string :unidad_monetaria
      t.boolean :recibir_notificaciones
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
