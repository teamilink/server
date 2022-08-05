Rails.application.routes.draw do

  resources :links
  
  get '/dashboard', to: 'dashboards#index'
  resources :appearances, path: '/dashboard/appearance'
  
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
  
end
