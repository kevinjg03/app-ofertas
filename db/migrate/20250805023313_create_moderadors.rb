class CreateModeradors < ActiveRecord::Migration[8.0]
  def change
    create_table :moderadors do |t|
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
