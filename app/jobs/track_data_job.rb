class TrackDataJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # takes instance of track
    # Create instance of datamapper
    # Call method to create geojson
  end
end
