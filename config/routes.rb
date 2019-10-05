Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  resources :meals
end