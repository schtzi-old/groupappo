class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  def self.reacted?(id1, id2)
    case1 = !Friendship.where(user_id: id1, friend_id: id2).empty?
    case2 = !Friendship.where(user_id: id2, friend_id: id1).empty?
    case1 == case2
  end

  def self.pending_reacted?(id1, id2)
    case1 = Friendship.where(user_id: id1, friend_id: id2, confirmed: true).empty?
    case2 = Friendship.where(user_id: id2, friend_id: id1, confirmed: true).empty?
    case1 == case2
  end
  def self.request_origin(id1, id2)
    case1 = Friendship.where(user_id: id1, friend_id: id2, confirmed: false).empty?
  end

  def self.find_friendship(id1, id2)
    if Friendship.where(user_id: id1, friend_id: id2, confirmed: false).empty?
      Friendship.where(user_id: id2, friend_id: id1, confirmed: false)[0].id
    else
      Friendship.where(user_id: id1, friend_id: id2, confirmed: false)[0].id
    end
  end

  def self.find_friends(id1)
    Friendship.where("user_id = ? AND confirmed = ? OR friend_id = ? AND confirmed = ?", id1, true, id1, true)
  end
end
