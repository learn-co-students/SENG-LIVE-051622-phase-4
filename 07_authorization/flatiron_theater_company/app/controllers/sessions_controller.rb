class SessionsController < ApplicationController

  # POST '/login'
  def create
    user = User.find_by_username(params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: user, status: :ok
    else 
      render json: "Invalid Credentials", status: :unauthorized
    end

  end

  # DELETE '/logout'
  def destroy
    session.delete(:user_id)
  end
  
end