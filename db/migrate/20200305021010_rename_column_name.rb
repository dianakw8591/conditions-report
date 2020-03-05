class RenameColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :station_id, :location_id
  end
end
