class AddCoordinatesToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :latitude, :float
    add_column :tracks, :longitude, :float
  end
end
