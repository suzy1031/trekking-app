class UsersController < ApplicationController
  before_action :set_user, only: [:show, :following, :followers]

  def index
    @users = User.order('updated_at DESC')
  end

  def show
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def following
    @title = "フォロー 一覧"
    @users = @user.following.page(params[:page]).per(10)
    render 'show-follow'
  end

  def followers
    @title = "フォロワー 一覧"
    @users = @user.followers.page(params[:page]).per(10)
    render 'show-follow'
  end

  private

  def set_user
    @user  = User.find(params[:id])
  end
end
