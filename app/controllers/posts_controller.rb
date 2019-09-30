class PostsController < ApplicationController
  def index
    @posts = Post.all.order('updated_at DESC')
    @meals = Meal.all.order('updated_at DESC')
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to :root
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:name, :text, :image, :elevation, :walking_distance, :difficulty)
  end

end
