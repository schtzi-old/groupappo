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
    load_coordinates
    create_track_image
    # create_geojson
    # inform frontend about new data via ActionCable
  end

  private

  def load_coordinates
    if file.attached?
      import_gpx
      calculate_distance
      calculate_vertical_meters
    elsif @address
      update(encoded_coordinates: encode_parameters([[lon, lat], [lon, lat]]))
    end
  end

  def create_track_image
    image_size = 300
    output = ERB::Util.url_encode(encoded_coordinates)
    url = "https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/path(#{output})/auto/#{image_size}x#{image_size}?access_token=#{ENV.fetch('MAPBOX_API_KEY')}"
    file = URI.open(url)
    image.attach(io: file, filename: "track-#{id}.png", content_type: "image/png")
  end

  def create_geojson
    decoded_coordinates = decode_parameters
    geojson = "{'type': 'geojson','data': {'type': 'Feature','properties': {},'geometry': {'type': 'LineString','coordinates':#{decoded_coordinates}}}}"
    update(data_geojson: geojson)
  end

  def import_gpx
    coords_raw = load_file.split.filter { |e| e.include?('lat') || e.include?('lon') }
    @coordinates_array = []
    i = 0
    while i < coords_raw.length
      lon = coords_raw[i][5..][..(coords_raw[i][6..].length - 3)].to_f
      lat = coords_raw[i + 1][5..][..(coords_raw[i + 1][6..].length - 3)].to_f
      @coordinates_array << [lon, lat]
      i += 2
    end
    update(encoded_coordinates: encode_parameters(@coordinates_array))
  end

  def calculate_distance
    coords = decode_parameters
    km = 0.0
    for i in (0..coords.length - 2) do
      km += Geocoder::Calculations.distance_between(coords[i], coords[i + 1])
    end
    update(total_km: km.round(1))
  end

  def calculate_vertical_meters
    elevation_raw = load_file.split.filter{ |e| e.include?('ele') }
    vm = 0.0
    vd = 0.0
    elevations = elevation_raw.map { |e| e.gsub('<ele>', "").gsub('</ele>', '').to_f }

    for i in (0..elevations.length - 2) do
      vd = elevations[(i + 1)] - elevations[i]
      vm += vd if vd.positive?
    end

    update(total_vm: vm)
  end

  def load_file
    download = file.attachment.blob.download
    debugger
    sleep 3
    return download
  end

  def encode_parameters(coordinates_array)
    FastPolylines.encode(coordinates_array, 5)
  end

  def decode_parameters
    FastPolylines.decode(encoded_coordinates, 5)
  end

  def validate_file_filetypes
    return unless file.attached?

    errors.add(:file, 'must be a gpx-file') unless file.content_type == 'application/xml'
  end
end
