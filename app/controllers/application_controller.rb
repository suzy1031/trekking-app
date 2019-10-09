class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :profile, :image, :remove_image])
  end

  def search
    @search = Post.ransack(search_params)
    @search_result = @search.result.page(params[:page]).per(20)
  end

  private

  def set_search
    @search = Post.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:name_or_text_cont)
  end
end
