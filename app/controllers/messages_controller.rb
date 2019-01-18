class MessagesController < ApplicationController

  before_action :set_chatroom
  def create
    message = @chatroom.messages.new message_params
    message.user = current_user
    if message.save
    else
      flash[:danger] = t "controller.messages.sen_mess_false"
    end
    redirect_to @chatroom
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
    return if @chatroom
    flash[:danger] = t "not_found_chatroom"
    redirect_to chatrooms_path
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
