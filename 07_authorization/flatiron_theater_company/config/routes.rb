Rails.application.routes.draw do
  resources :tickets, only: [:create]
  resources :users, only: [:show, :create]
  resources :productions, only: [ :index, :show, :create, :update, :destroy]
  post "/login", to: "sessions#create" 
  delete '/logout', to: "sessions#destroy"
end