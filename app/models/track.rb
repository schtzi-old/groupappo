# require 'polylines'
require "open-uri"
# require "nokogiri"
require "fast_polylines"

class Track < ApplicationRecord
  belongs_to :user
  has_many :gruppettos
  has_many :coordinates

  has_one_attached :file
  has_one_attached :image

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validate :validate_file_filetypes

  after_create :async_map_data

  def async_map_data
    TrackDataJob.perform_later(self)
  end

  def update_map_data
    encode_coordinates
    create_track_image
    # create_geojson
    # inform frontend about new data via ActionCable
  end

  private

  def encode_coordinates
    if file.attached?
      import_gpx
    elsif @address
      update(encoded_coordinates: FastPolylines.encode([[lon, lat], [lon, lat]], 5))
    end
  end

  def create_track_image
    image_size = 600
    output = ERB::Util.url_encode(encoded_coordinates)
    url = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/path(#{output})/auto/#{image_size}x#{image_size}?access_token=#{ENV.fetch('MAPBOX_API_KEY')}"
    file = URI.open(url)
    image.attach(io: file, filename: "track-#{id}.png", content_type: "image/png")
  end

  def create_geojson
    decoded_coordinates = FastPolylines.decode(@encoded_coordinates, 5)
    geojson = "{'type': 'geojson','data': {'type': 'Feature','properties': {},'geometry': {'type': 'LineString','coordinates':#{decoded_coordinates}}}}"
    update(data_geojson: geojson)
  end

  def import_gpx
    downloaded = file.attachment.blob.download
    puts downloaded
    coords_raw = downloaded.split.filter { |e| e.include?('lat') || e.include?('lon') }

    @coordinates_array = []
    i = 0
    while i < coords_raw.length
      lon = coords_raw[i][5..][..(coords_raw[i][6..].length - 3)].to_f
      lat = coords_raw[i + 1][5..][..(coords_raw[i + 1][6..].length - 3)].to_f
      @coordinates_array << [lon, lat]
      i += 2
    end
    update(encoded_coordinates: FastPolylines.encode(@coordinates_array, 5))
  end

  def validate_file_filetypes
    return unless file.attached?

    errors.add(:file, 'must be a gpx-file') unless file.content_type == 'application/xml'
  end
end
