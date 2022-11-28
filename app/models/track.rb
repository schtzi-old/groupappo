class Track < ApplicationRecord
  belongs_to :user
  has_many :gruppettos

  has_one_attached :track_file
end
