class UsersController < ApplicationController

  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :load_user, only: %i(show edit update destroy)
  def edit; end

  def show; end

  def index
    @users = User.order_by.page(params[:page]).per(Settings.permit)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "signup_succ"
      redirect_to login_path
    else
      render :new
    end
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
