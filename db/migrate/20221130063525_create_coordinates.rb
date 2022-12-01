class CreateCoordinates < ActiveRecord::Migration[7.0]
  def change
    create_table :coordinates do |t|
      t.float :latitude
      t.float :longitude
      t.references :track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
