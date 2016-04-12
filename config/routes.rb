Rails.application.routes.draw do
  devise_for :users
  root 'plays#index'
  resources :plays #creates all CRUD routes
end
