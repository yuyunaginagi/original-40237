Rails.application.routes.draw do
  devise_for :users
  root to: 'results#index'
  resources :results, only: [:index, :new, :create]
  resources :users, only: :show
end
