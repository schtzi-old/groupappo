class Gruppetto < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :participations

  has_many :participants, through: :participations, source: :user

  enum :gruppetto_status, { draft: 0, upcomming: 1, started: 2, finnished: 3 }, default: :draft
  enum :event_type, { invite_only: 0, friends: 1, open: 2 }, default: :invite_only
  enum :difficulty, { novice: 0, easy: 1, moderate: 2, hard: 3, double_black_diamond: 4 }, default: :novice
  enum :participation_rule, { manual: 0, auto: 1 }, default: :manual

  # validates :start, :name, :description, :gruppetto_status, :avg_speed, :difficulty, :event_type, :participation_rule,
  #           presence: true
end
