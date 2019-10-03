class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create(meal_params)
    if @meal.save
      flash[:success] = "投稿が完了しました！"
      redirect_to :root
    else
      flash.now[:alert] = "投稿が失敗しました。"
      render :new
    end
  end

  private

  def meal_params
    params.require(:meal).permit(
                                :name,
                                :image,
                                :food_stuff,
                                :cooking_time,
                                ).merge(user_id: current_user.id)
  end

end
