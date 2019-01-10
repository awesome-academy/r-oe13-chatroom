class FriendRequestsController < ApplicationController
  before_action :set_friend_request, except: [:index, :create]

  def create
    friend = User.find_by id: params[:friend_id]
    @friend_request = current_user.friend_request.new(friend: friend)
    if @friend_request.save
      flash[:success] = t "request_sent"
      redirect_to root_url
    else
      flash[:error] = t "request_error"
      redirect_to root_url
    end
  end

  def index
    @incoming = FriendRequest.incoming current_user
    @outgoing = current_user.friend_request
  end

  def destroy
    if @friend_request.destroy
      flash[:infor] = t "destroy_request"
    else
      flash[:danger] = t "destroy_request_err"
    end
    redirect_to friend_requests_url
  end

  def update
    @relationship = current_user.relationships.new(friend: @friend_request.friend)
    if @relationship.save
      flash[:success] = t "add_friend"
      @friend_request.destroy
      redirect_to friends_url
    else
      flash[:error] = t "add_friend_err"
    end
      redirect_to friend_requests_url
  end

  private

  def set_friend_request
    @friend_request = FriendRequest.find_by id: params[:id]
    return if @friend_request
    flash[:danger] = t "set_friend_request_error"
    redirect_to friend_requests_url
  end

end
