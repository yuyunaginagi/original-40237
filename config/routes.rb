Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :results, only: [:new, :create, :destroy]
  resources :users,   only: [:index, :show, :edit, :update]
  resources :reviews, only: [:new, :create, :show, :destroy] do 
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end
  
end
