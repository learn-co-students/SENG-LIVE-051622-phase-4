class ProductionsController < ApplicationController
    # GET /productions
    # responsible for getting all of the records of that resource 
    def index 
        render json: Production.all, status: :ok
    end 

    # def welcome 
    #     render json: { message: "Welcome to Flatiron Theater"}
    # end

    # # Create a dynamic route that will look like /welcome/1 and print the id from the params, we're going to call this welcome_show

    # def welcome_show
    #     byebug
    #     puts params[:id]
    # end

    # GET /productions/:id
    def show 
        production = Production.find(params[:id])
        # what happens if the id invalid. the record doesnt exist
        render json: production, status: :ok

    rescue ActiveRecord::RecordNotFound => error 
        render json: {message: error.message}

    end

    def create 
        production = Production.create(production_params)
        render json: production, status: :created
    end

    def update 
        production = Production.find(params[:id])
        production.update(production_params)
        render json: production, status: :ok
    rescue ActiveRecord::RecordNotFound => error 
        render json: {message: error.message}

    end

    def destroy 
        production = Production.find(params[:id])
        production.destroy
        head :no_content

    rescue ActiveRecord::RecordNotFound => error 
        render json: {message: error.message}
    end


    # to return some data where the productions are still ongoing. 

    def ongoing_productions 
        # how do i return only the productions that ongoing: true 
        productions = Production.where(ongoing: true)
        render json: productions, status: :ok
    end


    private 

    def production_params 
        params.permit(:title, :genre, :director, :description, :budget, :image, :ongoing)
    end

end
