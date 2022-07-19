Rails.application.routes.draw do
  resources :productions, only: [ :index, :show, :create, :update, :destroy]
  # Custome Route 

  
  #`rails routes` in the console will show the available routes
  # only will restrict the routes to specific actions
  # Bonus 
  # :as overrides the naming from the route helpers
  # resources :productions, as: plays
  
  # :controller explicitly specifiys a controler
  # Create a controler called operas to demonstrate
  # resources :productions, controller: 'operas'

  # namespace allows you to group specific routes 
  # create a folder in app/controllers/admin 
  # namespace :admin do
  #   resources :productions, only: [:create, :update, :delete]
  # end

  

end
