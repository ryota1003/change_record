Rails.application.routes.draw do
  get 'users/index'
  get 'sessions/new'
  get 'commodities/index'

  root 'commodities#index'
  
  get 'commodities/show'
  
  get 'commodities/new'
  
  resources :users
  resources :commodities
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
