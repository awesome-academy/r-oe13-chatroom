class ChatroomsController < ApplicationController

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    if @chatroom.save
      flash[:info] = t ".controller.chatrooms.create_chatroom_succ"
      redirect_to new_chatroom_path
    else
      render :new
    end
  end

  def destroy; end

  private

  def chatroom_params
    params.require(:chatroom).permit :name, :owner_id
  end
end
