Rails.application.routes.draw do
  resources :links
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'dashboards#index'
  post '/signup', to: 'users#create'
  post '/login', to: 'users#login'
end
