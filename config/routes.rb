Rails.application.routes.draw do

  devise_for :users

  root 'posts#index'



  resources :posts do
    resources :comments, only: [:create]
    resources :users, only: [:index, :show]
    collection do
      get 'search'
      get 'about'
      get 'usage'
      get 'notification'
      get 'ranking'
    end
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  post   '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'
  resources :relationships, only: [:create, :destroy]
  resources :meals

end