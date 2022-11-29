class Track < ApplicationRecord
  belongs_to :user
  has_many :gruppettos

  has_one_attached :track_file
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
