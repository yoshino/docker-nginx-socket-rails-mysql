Rails.application.routes.draw do
  get 'users/index'
  root to: 'top#index'
  resources :health_check, only: [:index]
  resources :users, only: [:index]
end
