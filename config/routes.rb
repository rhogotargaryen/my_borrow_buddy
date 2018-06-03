Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items
  resources :users, except: :index
  
  get '/test', to: 'static#test'
  get '/signin', to: 'sessions#new'
  get '/signout', to: "sessions#destroy"
  post '/signin', to: 'sessions#create'
end
