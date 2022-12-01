class Gruppetto < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :participations

  has_many :participants, through: :participations, source: :user

  enum :gruppetto_status, { draft: 0, upcomming: 1, started: 2, finnished: 3 }, default: :draft
  enum :event_type, { Invite_only: 0, Friends: 1, Open: 2 }, default: :Invite_only
  enum :difficulty, { Novice: 0, Easy: 1, Moderate: 2, Hard: 3, double_black_diamond: 4 }, default: :Novice
  enum :participation_rule, { Manual: 0, Auto: 1 }, default: :Manual

  # validates :name, :description, :gruppetto_status, :avg_speed, :difficulty, :event_type, :participation_rule,
  #           presence: true
end
