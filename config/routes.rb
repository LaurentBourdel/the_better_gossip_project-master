Rails.application.routes.draw do
  #get 'cities/show'
  #get 'users/show'
  root 'gossips#index'
  get 'team', to: 'static_pages#home'
  get 'contact', to: 'static_pages#contact'
  get 'welcome/:first_name', to: 'static_pages#welcome'
  #get 'gossips/:id', to: 'static_pages#gossip', as: 'gossip'
  #get 'users/:id', to: 'static_pages#user', as: 'user'
  resources :gossips
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
