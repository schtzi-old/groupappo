class Gruppetto < ApplicationRecord
  belongs_to :track
  belongs_to :user
  has_many :participations

  has_many :participants, through: :participations, source: :user
end
