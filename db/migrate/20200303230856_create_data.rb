class CreateData < ActiveRecord::Migration[6.0]
  def change
    create_table :data do |t|
      t.belongs_to :station, null: false, foreign_key: true
      t.datetime :date
      t.float :high_temp
      t.float :low_temp
      t.float :precip_accumulation
      t.string :precip_type
      t.float :swe
      t.float :snow_depth

      t.timestamps
    end
  end
end
