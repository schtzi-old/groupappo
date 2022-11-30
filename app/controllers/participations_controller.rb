class ParticipationsController < ApplicationController
  before_action :set_gruppetto, only: %i[create edit update]
  before_action :set__partication, only: %i[edit update destroy]

  def create
    @participation = Participation.new(gruppetto_id: @gruppetto.id, user_id: current_user.id)
    @participation.user = current_user
    authorize @participation

    if @participation.save
      # @participation.update(gruppetto_id: @gruppetto.id, user_id: current_user.id)
      redirect_to gruppettos_path
    else
      render 'gruppettos/show', alert: 'sth went wrong'
    end
  end

  def edit
  end

  # def update
  #   if accept
  #     @participation.update(participation_status: 1)
  #   else
  #     @participation.update(participation_status: 2)
  #   end
  #   redirect_to gruppetto_path(@gruppetto_id)
  # end

  def destroy
    @participation.destroy
    redirect_to gruppettos_index_path
  end

  private

  def set_gruppetto
    @gruppetto = Gruppetto.find(params[:gruppetto_id])
  end

  def set_participation
    @participation = participation.find(params[:id])
  end

  def participation_params
    params.permit(:gruppetto_id, :user_id, :participation_status)
  end
end
