class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :central_station_id
      t.string :img_url
      t.string :map_url

      t.timestamps
    end
  end
end
