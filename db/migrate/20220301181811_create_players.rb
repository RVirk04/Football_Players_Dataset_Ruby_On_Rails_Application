class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :overall
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
