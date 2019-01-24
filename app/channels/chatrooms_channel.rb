class ChatroomsChannel < ApplicationCable::Channel
  def subscribed
    current_user.chatrooms.each do |chatroom|
      stream_from "chatrooms:#{chatroom.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message data
    @chatroom = Chatroom.find_by id: data["chatroom_id"]
    if @chatroom
      message = @chatroom.messages.create(body: data[:body], user: current_user)
      MessageRelayJob.perform_later(message)
    else
      flash[:danger] = t ".controller.messages.sen_mess_false"
      redirect_to chatrooms_path
    end
  end
end
