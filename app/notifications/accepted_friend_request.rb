# To deliver this notification:
#
# AcceptedFriendRequest.with(post: @post).deliver_later(current_user)
# AcceptedFriendRequest.with(post: @post).deliver(current_user)

class AcceptedFriendRequest < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable

  # Add required params
  #
  param :friendship

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   friendship_path(params[:friendship])
  # end
end
