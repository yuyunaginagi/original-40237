Rails.application.routes.draw do
  devise_for :users
  resources :results, only: :index
end
