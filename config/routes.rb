Rails.application.routes.draw do

  devise_for :users

  root 'posts#index'



  resources :posts do
    resources :comments
    resources :users, only: [:index, :show]
    collection do
      get 'search'
      get 'about'
      get 'usage'
      get 'notification'
      get 'tab'
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
  resources :meals, only: [:index, :show]
  resources :rankings, only: [:index, :show]

end