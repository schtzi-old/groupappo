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
    @gruppetto = Gruppetto.new
    @tracks = policy_scope(Track)
    authorize @gruppetto
  end

  def create
    @gruppetto = Gruppetto.new(gruppetto_params)
    @gruppetto.track = Track.find(params[:track_id])
    @gruppetto.user = current_user
    @tracks = policy_scope(Track)
    authorize @gruppetto

    if @gruppetto.save
      redirect_to gruppetto_path(@gruppetto), notice: 'Gruppetto successfully created'
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def gruppetto_params
    params.require(:gruppetto).permit(:start, :name, :description, :gruppetto_status, :avg_speed, :difficulty,
                                      :event_type, :participation_rule)
  end

  private

  def set_gruppetto
    @gruppetto = Gruppetto.find(params[:id])
  end
end
