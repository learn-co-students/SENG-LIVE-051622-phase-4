class ProductionsController < ApplicationController
    before_action :find_production, only: [:show, :update, :destroy]
    skip_before_action :authenticate_user, [:create]
    before_action :is_authorized?, only: [:create]
    before_action :is_owner?, only: [:update, :destroy]

    # before_action :will run a method before teh listed actions logic is executed
    # skip_before_action is going to skip the method that is passed to it 

    def index 
        render json: Production.all, status: :ok
    end 

    def show
        render json: @production, include: :cast_members, status: :ok
    end 

    def create
        production = Production.create!(production_params, user_id: current_user.id)
        render json: production, status: :created
    end 

    def update 
        @production.update!(production_params)
        render json: @production, status: :accepted
    end 

    def destroy
        @production.destroy
        head :no_content 
    end 

    private
    
    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

    def find_production
        @production = Production.find(params[:id])
    end

    def is_owner? 
        permitted = @production.user_id == current_user.id 
        render json: {errors: {User: "does not own this"}}, status: :forbidden unless permitted
    end

end
