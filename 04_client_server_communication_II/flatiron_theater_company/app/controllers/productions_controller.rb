class ProductionsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index 
        render json: Production.all, status: :ok
    end 

    def show
        production = Production.find(params[:id])
        render json: production, status: :ok
    end 

    def create
        production = Production.create!(production_params)
        render json: production, status: :created
    end 

    def update 
       #Review error handling and create a rescue for RecordNotFound
        #Add the ! to update so it raises an exception

        production = Production.find(params[:id])
        production.update!(production_params)
        render json: production, status: :accepted
    end 

    def destroy
        production = Production.find(params[:id])
        production.destroy
        head :no_content 
    end 

    private
    
    #Review strong params and why they are useful with updates
    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

     def render_not_found(error)
        #confiure the response to work with the error handleng we have on the frontend. 
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 
end
