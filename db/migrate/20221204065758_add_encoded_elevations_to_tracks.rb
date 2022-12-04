class AddEncodedElevationsToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :encoded_elevations, :text
  end
end
