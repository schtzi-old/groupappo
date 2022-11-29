class GruppettosController < ApplicationController
  def index
  end

  def show
  end

  def new
    @gruppetto = Gruppetto.new
    @track = Track.first
    authorize @gruppetto
    authorize @track
  end

  def create
    @grupetto = Gruppetto.new(gruppetto_params)
  end

  private

  def gruppetto_params
    params.require(:gruppetto).permit(:start, :name, :description, :gruppetto_status, :avg_speed, :difficulty,
                                      :event_type, :participation_rule)
  end
end
