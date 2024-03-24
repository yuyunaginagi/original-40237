Rails.application.routes.draw do
  devise_for :users
  root to: 'results#index'
  resources :results, only: [:index, :new]
  resources :users, only: :show
end
