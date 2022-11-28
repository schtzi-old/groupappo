class Track < ApplicationRecord
  belongs_to :user

  has_one_attached :track_file
end
