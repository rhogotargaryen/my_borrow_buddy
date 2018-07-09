# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items

  resources :items, only: %i[show index] do
    resources :transactions, only: %i[new index]
  end

  resources :users
  
  resources :users, only: %i[show index] do
    resources :items, only: %i[show new index edit]
  end
  
  resources :liked_items, only: :create
  
  resources :likes, only: %i[edit update show]

  root 'static#welcome'
  get '/test', to: 'static#test'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/signup', to: 'users#new'
  get '/auth/facebook/callback', to: 'sessions#create'
  post '/signin', to: 'sessions#create'
  post '/items/:item_id/transactions/new', to: 'transactions#new'
  post '/ratings/:like_id', to: 'likes#rating'
end
