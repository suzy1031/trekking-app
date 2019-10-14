Rails.application.routes.draw do

  devise_for :users

  root 'posts#index'

  # get '/notification', to: 'posts#notification'
  # get 'usage'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :users, only: [:index, :show]
    collection do
      get 'search'
      get 'about'
      get 'usage'
      get 'notification'
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :meals

end