class AddEncodedCoordinatestoTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :encoded_coordinates, :text
  end
end
