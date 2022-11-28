class AddAddressToTracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :address, :string
  end
end
