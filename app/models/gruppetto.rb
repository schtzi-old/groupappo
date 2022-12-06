class Gruppetto < ApplicationRecord
  SPEED_RANGE = (15..50)

  belongs_to :track
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_one :chatroom, dependent: :destroy

  has_many :participants, through: :participations, source: :user

  enum :gruppetto_status, { draft: 0, upcoming: 1, started: 2, finished: 3 }, default: :upcoming
  enum :event_type, { Invite_only: 0, Friends: 1, Open: 2 }, default: :invite_only
  enum :difficulty, { Easy: 0, Moderate: 1, Hard: 2 }
  enum :participation_rule, { Manual: 0, Auto: 1 }

  validates :avg_speed, numericality: { only_integer: true, in: SPEED_RANGE }

  # validates :name, :description, :gruppetto_status, :avg_speed, :difficulty, :event_type, :participation_rule,
  #           presence: true
end
