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
    
    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 

     def render_not_found(error)
        render json: {errors: {error.model => "Not Found"}}, status: :not_found
    end 
end
