class GruppettosController < ApplicationController
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
  end

  def new
  end

  def create
  end
end
