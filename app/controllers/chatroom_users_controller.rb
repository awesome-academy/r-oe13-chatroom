class ChatroomUsersController < ApplicationController

  before_action :set_chatroom
  def create
    @chatroom_user = @chatroom.chatroom_users.by_user(current_user.id).first_or_create
    redirect_to @chatroom
  end

  def destroy
    respond_to do |format|
      @chatroom_user = @chatroom.chatroom_users.by_user(current_user.id).destroy_all
      format.js {render layout: false}
      format.html {redirect_to chatrooms_path}
    end
  end

  private
  def set_chatroom
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
    return if @chatroom
    flash[:danger] = t "not_found_chatroom"
    redirect_to chatrooms_path
  end
end
