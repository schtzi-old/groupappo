class NotificationsController < ApplicationController
  def index
    @notifications = policy_scope(Notification)
  end

  def update
    @notification = Notification.find(params[:id])
    authorize @notification
    if @notification.update(read_at: Time.now)
      notification_redirection
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def notification_redirection
    case @notification.type
    when "NewFriendRequestNotification" || "AcceptedFriendRequest"
      redirect_to friendships_path
    when "NewParticipationRequest" || "AcceptedParticipantRequest"
      redirect_to gruppetto_path(@notification.params[:participation].gruppetto)
    end
  end
end
