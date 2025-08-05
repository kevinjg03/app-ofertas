class CreateNotificacions < ActiveRecord::Migration[8.0]
  def change
    create_table :notificacions do |t|
      t.references :tipo_notificacion, null: false, foreign_key: true
      t.text :mensaje
      t.datetime :fecha_envio
      t.boolean :estado_leido
      t.string :medio
      t.references :usuario, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end
  end
end
