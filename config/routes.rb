Facility::Application.routes.draw do
  devise_for :users, skip: [:registrations]

  resources :users
  resources :rooms
  resources :shops
  resources :reservations

  root to: 'dashboard#index'
end
