module MessagesHelper
  def mess_of_user message
    message.user == current_user
  end
end
