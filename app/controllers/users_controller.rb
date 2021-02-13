class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all.page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.all.page(params[:page]).per(6)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.followings.all.page(params[:page]).per(6)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.all.page(params[:page]).per(6)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
