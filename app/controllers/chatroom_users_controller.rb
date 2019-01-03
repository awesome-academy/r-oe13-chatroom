class ChatroomUsersController < ApplicationController

  before_action :set_chatroom
  def create; end

  def destroy; end

  private
  def set_chatroom
    @chatroom = Chatroom.find_by id: params[:chatroom_id]
    return if @chatroom
    flash[:danger] = t "not_found_chatroom"
    redirect_to chatrooms_path
  end
end
