class ProductionsController < ApplicationController
    def index 
        render json: Production.all, status: :ok
    end 

    def show
        # byebug 
        # take a moment to explore the params hash.
        production = Production.find(params[:id])
        render json: production, status: :ok
    end 

    # Custome Route example
    # def welcome
    #     render json: {message:"Welcome to Flatiorn Theater Company!"}, status: :ok
    # end 

    # def welcome_show
    #     render json: {message:"Welcome #{params[:id]}!"}, status: :ok

    # end 

    # Demo the folloiwng with Postman
    # rails uses mass assignment to pass params as a single object. 
    # However, rails requires strong params to protect the data
    def create
        #byebug
        # use byebug to dig into params
        # test data for postman
        # {
        #     "title": "Macbeth", 
        #     "genre": "Tragedie"
        #     "director": "Bill Shakespeare",
        #     "description": "Macbeth is a tragedy by William Shakespeare. It is thought to have been first performed in 1606. It dramatises the damaging physical and psychological effects of political ambition on those who seek power.", 
        #     "budget": 100000.00, 
        #     "image":"https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/First-page-first-folio-macbeth.jpg/220px-First-page-first-folio-macbeth.jpg", 
        #     "ongoing":true
        # }
        production = Production.create!(production_params)
        render json: production, status: :created
    end 

    def update 
        # test data
        #   {"director": "William Shakespeare"}
        production = Production.find(params[:id])
        production.update(production_params)
        render json: production, status: :accepted
    end 

    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content 
    end 


    private
#   Rails by default will wrap JSON parameters (Links to an external site.) as a nested hash under a key based on the name of the controller 
#   To disable update config/initializers/wrap_parameters.rb with the below 
#   wrap_parameters format: [:json]
    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 
end
