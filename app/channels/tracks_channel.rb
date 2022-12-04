class TracksChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    track = Gruppetto.find(params[:id]).track
    stream_for track
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
