class ProductionsController < ApplicationController
    before_action :find_production, only: [:show, :update, :destroy]

    def index 
        render json: Production.all, status: :ok
    end 

    def show
        render json: @production, status: :ok
    end 

    def create
        byebug
        production = Production.create!(production_params)
        render json: production, status: :created
    end 

    def update 
        @production.update!(production_params)
        render json: production, status: :accepted
    end 

    def destroy
        @production.destroy
        head :no_content 
    end 

    private
    
    #Review strong params and why they are useful with updates
    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

    def find_production
        @production = Production.find(params[:id])
    end


end
