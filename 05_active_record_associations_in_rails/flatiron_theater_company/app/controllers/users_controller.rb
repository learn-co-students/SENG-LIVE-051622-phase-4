class UsersController < ApplicationController

  def show 
    # how do I return a user with the association tickets
    user = User.find(params[:id])
    render json: user, include: ["tickets", "tickets.production"], status: :ok
  end
end
