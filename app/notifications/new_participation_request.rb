# To deliver this notification:
#
# NewParticipationRequest.with(post: @post).deliver_later(current_user)
# NewParticipationRequest.with(post: @post).deliver(current_user)

class NewParticipationRequest < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  deliver_by :action_cable

  # Add required params
  #
  param :participation

  # Define helper methods to make rendering easier.
  #
  # def message
  #   t(".message")
  # end
  #
  # def url
  #   post_path(params[:post])
  # end
end
