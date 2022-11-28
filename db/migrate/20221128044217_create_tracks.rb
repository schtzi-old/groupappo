class CreateTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.float :total_km
      t.float :total_vm
      t.text :data_gpx
      t.text :data_geojson
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
