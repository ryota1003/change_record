Rails.application.routes.draw do
  get 'users/index'
  get 'sessions/new'
  # get 'commodities/index'

  #アプリを起動したときに最初にとぶ画面
  root 'pages#index'
  
  # get 'commodities/show'
  
  # get 'commodities/new'
  
  # get 'commodities/edit', to: 'commodities#edit'
  
  # delete 'commodities/:id', to: 'commodities#destroy'
  
  resources :users
  resources :commodities
  resources :pages
  
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
