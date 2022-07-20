class ProductionsController < ApplicationController
    before_action :find_production, only: [:show, :update, :destroy]

    def index 
        render json: Production.all, status: :ok
    end 

    def show
        render json: @production, status: :ok
    end 

    def create
        production = Production.create!(production_params)
        render json: production, status: :created
        # methods that will invoke our validations: .save, .valid?
        
        # .valid? 
        # if production.valid? 
        #     render json: production, status: :created
        # else
        #     render json: { errors: production.errors.full_messages}, status: :unprocessable_entity
        # end

        # rescue: for this we need to raise an exception
        # rescue ActiveRecord::RecordInvalid => invalid 
        #     render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end 

    def update 
        @production.update(production_params)
        render json: production, status: :accepted
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

end
