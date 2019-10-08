class UsersController < ApplicationController

  def show
    @user = User.find( params[:id] )
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end
