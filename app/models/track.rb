require 'polylines'

class Track < ApplicationRecord
  belongs_to :user
  has_many :gruppettos

  has_one_attached :track_file
  validates :name, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?



  public

  # after_commit :update_map_data

  # after file-save run file-analyzer - if gpx, then call gpx to coordinates and save it
  # additionally create and safe the polyline

  def update_map_data
    # Create
    if true # file has been updated
      read_coordinates
    end
    if address
      self.data_geojson = Polylines::Encoder.encode_points([[latitude.round(6), longitude.round(6)], [latitude.round(6), longitude.round(6)]])
    else
      p 'todo for when we have file upload'
      data_gpx
    end
  end

  private

  # def read_coordinates
  #   if track_file.


  # def validate_file_filetypes
  #   return unless track_file.attached?

  #   p "hasjnbdasbjkdkbhasfbhjajhbdashjvdVGKAHCKVJBLKNBHJVKJGCFGZHLJKBVGCFJXDHFUTRFZIUGIHÖJKNBHVGCFJUZITUGOIHJÖNKLBHVGCJFXDFUCZIGUHIJÖKNB VCGFDXHCJHVHBLJKNÖB VCGFGZHUJKNB"
  #   errors.add(:track_file, 'must be a gpx-file') unless track_file.content_type == 'gpx'
  # end
end
