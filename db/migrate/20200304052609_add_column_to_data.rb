class AddColumnToData < ActiveRecord::Migration[6.0]
  def change
    add_column :data, :observed_temp, :float
  end
end
