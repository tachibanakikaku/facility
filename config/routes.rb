Facility::Application.routes.draw do
  devise_for :users

  resources :users
  resources :equipment
  resources :shops

  root to: 'dashboard#index'
end
