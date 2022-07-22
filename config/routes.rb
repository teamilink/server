Rails.application.routes.draw do

  resources :links
  
  get '/dashboard', to: 'dashboards#index'
  resources :appearances, path: '/dashboard/appearances'
  
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'

  # remove below line if /:username routing is defined in react routes
  match '/:username', to: 'dashboards#index', via: [:get]
end
