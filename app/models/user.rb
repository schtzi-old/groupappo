class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations
  has_many :gruppettos, through: :participations
  has_many :tracks, dependent: :destroy

  enum :level, { novice: 0, intermediate: 1, pro: 2, merckx: 3 }, default: :novice
  validates :first_name, :last_name, :email, :password, presence: true

end
