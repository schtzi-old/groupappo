class GruppettosController < ApplicationController
  before_action :set_gruppetto, only: [:show]

  def index
    @gruppettos = policy_scope(Gruppetto)
    # The `geocoded` scope filters only flats with coordinates
    # For each Gruppetto get the latitiude and the longitude. Then save it in an array of markers.
    # @markers = @gruppettos.geocoded.map do |gruppetto|
    #   {
    #     lat: gruppetto.track.latitude,
    #     lng: gruppetto.track.longitude
    #   }
    # end
  end

  def show
    authorize @gruppetto
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
