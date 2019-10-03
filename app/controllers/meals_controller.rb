class MealsController < ApplicationController
  def new
    @meal = Meal.new
  end

  def show
    @meal = Meal.find(params[:id])
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

  def destroy
    @meal = Meal.find(params[:id])
    if @meal.destroy
      flash[:success] = '商品を削除しました'
      redirect_to :root
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      render :show
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
