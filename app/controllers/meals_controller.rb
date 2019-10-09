class MealsController < ApplicationController

  def show
    @post = Post.find( params[:id] )
    @meal = Meal.find(params[:id])
  end

end
