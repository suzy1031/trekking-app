class UsersController < ApplicationController

  def show
    @user = User.find( params[:id] )
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def following
    @title = "フォロー 一覧"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(10)
    render 'show-follow'
  end

  def followers
    @title = "フォロワー 一覧"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
    render 'show-follow'
  end
end
