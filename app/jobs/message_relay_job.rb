class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "chatrooms:#{message.chatroom.id}", {
      body: message.body,
      chatroom_id: message.chatroom.id,
      user_name: message.user_name
    }
  end
end
