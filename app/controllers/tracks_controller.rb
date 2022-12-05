class TracksController < ApplicationController
  def index
    @tracks = policy_scope(Track)
  end
end
