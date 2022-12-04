class TracksChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    track = Track.find(params[:id])
    p "hello #{params[:id]}"
    stream_for track
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
