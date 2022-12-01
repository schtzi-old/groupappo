class TrackDataJob < ApplicationJob
  queue_as :default
  sidekiq_options retry: false

  def perform(track)
    sleep 3
    track.update_map_data
  end
end
