class MealsController < ApplicationController

  def index
    @meals = Meal.includes(:post).order('updated_at DESC')
  end
  def show
    @post = Post.find(params[:id])
    @meal = Meal.find(params[:id])
  end

end
