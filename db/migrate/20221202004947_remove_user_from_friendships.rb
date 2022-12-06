class RemoveUserFromFriendships < ActiveRecord::Migration[7.0]
  def change
    remove_reference :friendships, :user, null: false, foreign_key: true
  end
end
