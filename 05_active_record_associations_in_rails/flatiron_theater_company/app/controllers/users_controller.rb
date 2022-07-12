class UsersController < ApplicationController
    def show 
        user = User.find(params[:id])
        render json: user, include:[:tickets => {:include => :production}], status: :ok
    end 
end
