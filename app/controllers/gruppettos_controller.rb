class GruppettosController < ApplicationController
  def index
  end

  def show
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
end
