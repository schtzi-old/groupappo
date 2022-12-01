class ParticipationsController < ApplicationController
  before_action :set_gruppetto, only: %i[create edit update]
  before_action :set_participation, only: %i[edit update accept reject destroy]

  def create
    @participation = Participation.new(gruppetto_id: @gruppetto.id, user_id: current_user.id)
    @participation.user = current_user
    authorize @participation

    if @participation.save
      redirect_to gruppetto_path(@gruppetto), notice: "Requested to join Gruppetto"
    else
      render 'gruppettos/show', alert: 'Something went wrong'
    end
  end

  def accept
    authorize @participation
    if @participation.update(participation_status: 1)
      redirect_to gruppetto_path(params[:gruppetto_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def reject
    authorize @participation
    if @participation.update(participation_status: 2)
      redirect_to gruppetto_path(params[:gruppetto_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @participation.destroy
    authorize @participation
    redirect_to gruppettos_path, status: :see_other
  end

  private

  def set_gruppetto
    @gruppetto = Gruppetto.find(params[:gruppetto_id])
  end

  def set_participation
    @participation = Participation.find(params[:id])
  end

  def participation_params
    params.require(:participant).permit(:gruppetto_id, :user_id, :participation_status)
  end
end
