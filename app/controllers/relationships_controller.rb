class RelationshipsController < ApplicationController
  before_action :set_friend, only: :destroy

  def destroy
    @relationship = current_user.relationships. find_by friend: @friend
    if @relationship.destroy
      flash[:success] = t "unfriend"
    else
      flash[:danger] = t "has_error"
    end
    redirect_to friends_url
  end

  def index
    @friends = current_user.friends
  end

  private

  def set_friend
    @friend = current_user.friends.find_by id: params[:id]
    return if @friend
    flash[:danger] = t "has_error"
    redirect_to friends_url
  end

end
