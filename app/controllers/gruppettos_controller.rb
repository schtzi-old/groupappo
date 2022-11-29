class GruppettosController < ApplicationController
  before_action :set_gruppetto, only: [:show]

  def index
    @gruppettos = policy_scope(Gruppetto)
    # The `geocoded` scope filters only flats with coordinates
    # For each Gruppetto get the latitiude and the longitude. Then save it in an array of markers.
    # @markers = @gruppettos.map do |gruppetto|
    #   {
    #     lat: gruppetto.track.latitude,
    #     lon: gruppetto.track.longitude
    #   }
    # end
    @tracks = policy_scope(Track)
    @markers = @tracks.map do |track|
      {
        lat: track.latitude,
        lng: track.longitude
      }
    end




    # @track_datas = []
    # @gruppettos.each do |gruppetto|
    #   @track_datas << {
    #     lat: gruppetto.track.latitude,
    #     lon: gruppetto.track.longitude
    #   }
    # end
    # @markers = @track_datas.geocoded.map do |track_data|
    #   {
    #     lat: track_data.lat,
    #     lon: track_data.lon
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
