module ChatroomsHelper
  def owner_chatroom (chatroom, user)
    chatroom.owner_id == user
  end
end
