class AddUserIdToFriendships < ActiveRecord::Migration[7.0]
  def change
    add_column :friendships, :user_id, :integer
    add_index :friendships, :user_id
  end
end
