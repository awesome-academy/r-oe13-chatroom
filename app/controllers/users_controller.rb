class UsersController < ApplicationController
  before_action :load_user, only: %i(show edit update)

  def edit; end

  def show; end

  def index
    @users=User.all
  end

  def new
    @user = User.new
  end

  def update
    if @user.update_attributes user_params
      flash[:success]= t "update_succ"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "not_found"
    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation, :phone_number
  end
end
