class CreateAsteroids < ActiveRecord::Migration[7.2]
  def change
    create_table :asteroids do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
