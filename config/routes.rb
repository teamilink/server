Rails.application.routes.draw do

  resources :links
  
  get '/dashboard', to: 'dashboards#index'
  # get '/dashboard?:params', to: 'dashboards#show'
  resources :appearances, path: '/dashboard/appearance'
  
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  
end
