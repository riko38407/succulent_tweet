Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end
  
  resources :tweets do
    resources :comments, only: :create
  end

  resources :pictorial_books
end

