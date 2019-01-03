class ChatroomsController < ApplicationController

  before_action :set_chatroom, except: %i(index new create)
  def show
    @member = @chatroom.chatroom_users
  end

  def index
    @chatrooms = Chatroom.all
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    @chatroom = Chatroom.new chatroom_params
    if @chatroom.save
      @chatroom.chatroom_users.by_user(current_user.id).create
      flash[:info] = t "controller.chatrooms.create_chatroom_succ"
      redirect_to chatrooms_path
    else
      render :new
    end
  end

  def destroy
    if owner_chatroom == true
      if @chatroom.destroy
        flash[:info] = t "controller.chatrooms.delete_chatroom_succ"
      else
        flash[:danger] = t "controller.chatrooms.delete_chatroom_false"
      end
      redirect_to chatrooms_path
    else
      flash[:danger] = t "not_owner_chatroom"
      redirect_to chatrooms_path
    end
  end

  private
  
  def chatroom_params
    params.require(:chatroom).permit :name, :owner_id
  end

  def set_chatroom
    @chatroom = Chatroom.find_by id: params[:id]
    return if @chatroom
    flash[:danger] = t "not_found_chatroom"
    redirect_to chatrooms_path
  end

  def owner_chatroom
    @chatroom = Chatroom.find_by id: params[:id]
    if @chatroom.owner_id == current_user.id
      return true
    else
      return false
    end
  end
end
