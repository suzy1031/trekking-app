class PostsController < ApplicationController
  def index
    @posts = Post.all.order('updated_at DESC')
    @meals = Meal.all.order('updated_at DESC')
  end

  def show
  end
end
