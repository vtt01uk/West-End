Rails.application.routes.draw do
  root 'plays#index'
  resources :plays #creates all CRUD routes
end
