class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: params[:id])
  end

  def current
    @user = current_user
    @posts = Post.where(user_id: current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:username, :profile, :email, :image, :password)
  end
end
