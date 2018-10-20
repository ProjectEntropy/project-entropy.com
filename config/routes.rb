Rails.application.routes.draw do
  devise_for :users

  resources :posts

  resources :users

  root to: 'visitors#index'
end
