class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
    @topics = Topic.where(user_id: @user.id)
  end
end
