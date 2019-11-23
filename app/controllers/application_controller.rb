class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :image, :remove_image])
  end

  def search
    if params[:q].present?
      @search_result = @search.result.where.not(user_id: current_user.id).page(params[:page]).per(20)
    else
      render :search
    end
  end

  private

  def set_search
    @search = Post.includes(:user).ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:name_or_text_cont, :prefecture_id_eq)
  end
end
