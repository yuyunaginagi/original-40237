Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'
  resources :results, only: [:new, :create, :destroy]
  resources :users,   only: [:index, :show, :edit, :update]
  resources :reviews, only: [:new, :create]
  
end
