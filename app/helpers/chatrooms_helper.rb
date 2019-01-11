module ChatroomsHelper
  def owner_chatroom chatroom
    chatroom.owner_id == current_user.id
  end
end
