class GruppettosController < ApplicationController
  before_action :set_gruppetto, only: [:show]
  skip_before_action :authenticate_user!, only: [ :test]
  def test
    @gruppetto = Gruppetto.last
    authorize @gruppetto
  end

  def index
    params[:type] = "upcoming" if params[:type].nil?
    if params[:type] == "upcoming"
      @gruppettos = policy_scope(Gruppetto.where("start > ?", Time.now))
    elsif params[:type] == "past"
      @gruppettos = policy_scope(Gruppetto.where("start < ?", Time.now))
    elsif params[:type] == "going"
      # @gruppettos = policy_scope(Gruppetto.where("start > ?", Time.now)).participations.where(user: current_user)
      # <%= @attending_count = gruppetto.participations.count {|attending| attending.participation_status == "Attending" } %>
      @gruppettos = policy_scope(Gruppetto.joins(:participations).where(user: current_user))
    else
      @gruppettos = policy_scope(Gruppetto)
    end
    # The `geocoded` scope filters only flats with coordinates
    # For each Gruppetto get the latitiude and the longitude. Then save it in an array of markers.
    @markers = @gruppettos.map do |gruppetto|
      {
        lat: gruppetto.track.latitude,
        lng: gruppetto.track.longitude
      }
    end
  end

  def show
    authorize @gruppetto
    @track = @gruppetto.track
    @marker = { lat: @track.latitude, lng: @track.longitude }
    @markers = []
    @markers << @marker
  end

  def new
    @gruppetto = Gruppetto.new
    authorize @gruppetto

    @tracks = policy_scope(Track)
    @track = Track.new
    authorize @track
  end

  def create
    @gruppetto = Gruppetto.new(gruppetto_params)

    @gruppetto.track = retrieve_track
    @gruppetto.user = current_user

    authorize @gruppetto

    if @gruppetto.save
      @participation = Participation.create(user_id: @gruppetto.user_id, gruppetto_id: @gruppetto.id, participation_status: "Attending")
      @chatroom = Chatroom.create(gruppetto_id: @gruppetto.id)
      @message = Message.create(user_id: @gruppetto.user_id, chatroom_id: @chatroom.id, content: " Welcome! #{@gruppetto.name.capitalize} has been created by #{@gruppetto.user.first_name.capitalize}.")
      redirect_to gruppetto_path(@gruppetto), notice: 'Gruppetto successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  # Refactor & use controller instead of directly working with Track

  def retrieve_track
    if params[:track_option] == "new"
      track = Track.new(track_params)
      track.user = current_user

      return track if track.save

    else
      Track.find(track_params[:id])
    end
  end

  def track_params
    params[:gruppetto].require(:track).permit(:id, :name, :address, :total_km, :total_vm, :file)
  end

  def gruppetto_params
    params.require(:gruppetto).permit(:start, :name, :description, :gruppetto_status, :avg_speed, :difficulty,
                                      :event_type, :participation_rule, :track)
  end

  def set_gruppetto
    @gruppetto = Gruppetto.find(params[:id])
  end
end
