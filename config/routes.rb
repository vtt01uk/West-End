Rails.application.routes.draw do
  
  root 'plays#index'
  
  devise_for :users
  
  resources :plays do
    resources :reviews
  end
end
