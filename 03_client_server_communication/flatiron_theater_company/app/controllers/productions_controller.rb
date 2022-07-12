class ProductionsController < ApplicationController
    # Validations pt 3
    # rescue_from works like rescue but will work for the entire controller.
    # with: will point to the method that will handle the error responce. 
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def index 
        #byebug 
        #Observe the GET request hitting this action
        render json: Production.all, status: :ok
    end 

    def show
        #byebug 
        #Observe the GET request hitting this action
        production = Production.find(params[:id])
        render json: production, status: :ok
    end 

    def create
        #byebug
        # Pause the code here to take a look at the params as they come from our form. 
        # This is a good place for some debugging practice. Try adding some commen bugs and gotchas. 
        production = Production.create!(production_params)
        render json: production, status: :created
        # Validations pt 1
        # .valid will return flase if the instance created is invalid
        # The errors for the failed validations can be found on the instance under .errors.full_messages
        #production = Production.create(production_params)
        # production = Production.create(production_params)
        # if production.valid?
        #     render json: production, status: :created
        # else 
        #     render json: {errors: production.errors.full_messages} status: :unprocessable_entity
        # end 

        # Validations pt 2
        # adding a ! to .create will cause it to raise an exception if the validation fails. 
        # Adding a rescue block will trigger if an exception is raised. 
        # ActiveRecord::RecordInvalid is the exception the will trigger the rescue, 
        # The invalid variable gives us access to an instance of the exception, which holds the record method that retrives the errors. 
        # rescue ActiveRecord::RecordInvalid => invalid
        #     render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end 

    def update 
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

    def production_params
        params.permit(:title, :genre, :description, :budget, :image, :director, :ongoing)
    end 

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors}, status: :unprocessable_entity
    end 
end
