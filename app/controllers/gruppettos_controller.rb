class GruppettosController < ApplicationController
  before_action :set_gruppetto, only: [:show]

  def index
  end

  def show
    authorize @gruppetto
    @track = @gruppetto.track
    @marker = { lat: @track.latitude, lng: @track.longitude }
    @markers = []
    @markers << @marker
  end

  def new
  end

  def create
  end

  private

  def set_gruppetto
    @gruppetto = Gruppetto.find(params[:id])
  end
end
