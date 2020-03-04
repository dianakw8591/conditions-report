class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.belongs_to :location, null: false, foreign_key: true
      t.integer :elevation
      t.float :lat
      t.float :lng
      t.string :name
      t.string :triplet
      t.integer :avg_snowpack

      t.timestamps
    end
  end
end
