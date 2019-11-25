class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  def index
    @meals = Meal.order('updated_at DESC')
  end
  def show
    @title = "投稿詳細"
    @post = Post.find(params[:id])
  end

  def edit
  end

  def update
    if @meal.user_id == current_user.id
      if @meal.update(meal_params)
        flash[:success] = "編集が完了しました！"
        redirect_to :root
      else
        flash.now[:alert] = '商品の編集に失敗しました'
        render :edit
      end
    end
  end

  def destroy
    if @meal.destroy
      flash[:success] = '商品を削除しました'
      redirect_to :root
    else
      flash.now[:alert] = '商品の削除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def meal_params
    params.require(:meal).permit(
          :name,
          :image,
          :cooking_time,
          :food_stuff,
          :cooking_method,
          :remove_image
    ).merge(user_id: current_user.id)
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

end
