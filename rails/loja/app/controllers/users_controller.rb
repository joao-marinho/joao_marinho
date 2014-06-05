class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    @user.save
    redirect_to @user
  end

  def edit

  end

  def update
    @user.update(user_param)
    redirect_to @user
  end

  def destroy
    begin
      @user.destroy
    rescue StandardError => e

    end
    redirect_to users_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_param
    params.require(:user).permit(:name, :password, :group_id, :password_confirmation)
  end

end
