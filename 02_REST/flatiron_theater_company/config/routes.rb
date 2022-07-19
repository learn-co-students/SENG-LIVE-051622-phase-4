Rails.application.routes.draw do

  # get "/productions", to: "productions#index"

  # get '/welcome', to: "productions#welcome"

  # get 'welcome/:id', to: "productions#welcome_show"
  
  # we are going to use when we want to follow the REST pattern
  resources :productions, only: [:index, :show, :create, :update, :destroy], controller: 'operas'

  get '/', to: "production#index"

  get '/ongoing_productions', to: "productions#ongoing_productions"
end
