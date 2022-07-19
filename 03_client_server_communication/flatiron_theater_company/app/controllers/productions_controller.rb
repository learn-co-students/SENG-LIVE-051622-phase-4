class ProductionsController < ApplicationController
  
    def index 
        render json: Production.all, status: :ok
    end 

    def show
        production = Production.find(params[:id])
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
        render json: production, status: :accepted
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

    private

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

end
