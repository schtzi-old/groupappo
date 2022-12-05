class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :gruppettos, through: :participations, dependent: :destroy
  has_many :tracks, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :pending_friendships, -> {where confirmed: false}, class_name: 'friendship', foreign_key: "friend_id"


  enum :level, { novice: 0, intermediate: 1, pro: 2, merckx: 3 }, default: :novice
  validates :first_name, :last_name, :email, :password, presence: true

  def friends
    f_sent = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    f_recieved = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
    f_id = f_sent + f_recieved
    User.where(id: f_id)
  end

  def friends_with?(user)

  end

  def send_invitation(user)

  end
end
