class GruppettosController < ApplicationController
  before_action :set_gruppetto, only: [:show]
  skip_before_action :authenticate_user!, only: [:search]
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
      @gruppettos = policy_scope(Gruppetto.joins(:participations).where(user: current_user))
    else
       @gruppettos = policy_scope(Gruppetto)
    end

    # not showing
    # friend only
    # invite only
    if params[:speed].nil? || params[:speed] == ""
    else
      @gruppettos = @gruppettos.select { |test| test.avg_speed.to_i >= params[:speed].to_i }
    end
    if params[:difficulty].nil?
    else
      @gruppettos = @gruppettos.select { |test| test.difficulty == params[:difficulty] }
    end
    if params[:start_date].nil? || params[:start_date] == ""
    else
      @gruppettos = @gruppettos.select { |test| test.start >= params[:start_date] }
    end
    if params[:end_date].nil? || params[:end_date] == ""
    else
      @gruppettos = @gruppettos.select { |test| test.start <= params[:end_date] }
    end
    # The `geocoded` scope filters only flats with coordinates
    # For each Gruppetto get the latitiude and the longitude. Then save it in an array of markers.
    unless @gruppettos.empty?
      @markers = @gruppettos.map do |gruppetto|
        {
          lat: gruppetto.track.latitude,
          lng: gruppetto.track.longitude
        }
      end
    end

  end

  def search
    @gruppettos = policy_scope(Gruppetto.joins(:participations).where(user: current_user))
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
      # @participation = Participation.create(user: @gruppetto.user, gruppetto: @gruppetto, participation_status: "Attending")
      # @chatroom = Chatroom.create(gruppetto: @gruppetto)
      # @message = Message.create(user: @gruppetto.user, chatroom: @chatroom, content: " Welcome! #{@gruppetto.name.capitalize} has been created by #{@gruppetto.user.first_name.capitalize}.")
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
