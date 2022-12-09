class ChatroomsController < ApplicationController
  def show
    @chatroom = Gruppetto.find(params[:gruppetto_id]).chatroom
    authorize @chatroom

    @message = Message.new
  end
end
