# To deliver this notification:
#
# NewFriendRequestNotification.with(friendship: @friendship).deliver_later(current_user)
# NewFriendRequestNotification.with(friendship: @friendship).deliver(current_user)

class NewFriendRequestNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable

  # Add required params
  param :friendship

  # Define helper methods to make rendering easier.
  # def message
  #   t("#{params[:friendship].user.first_name} has sent you a friend request")
  # end

  # def url
  #   friendship_path(params[:friendship])
  # end
end
