class DropCoordinates < ActiveRecord::Migration[7.0]
  def change
    drop_table :coordinates
  end
end
