class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])
    # user && user.authenticate(params[:password])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      # session is accessibly only to our controllers 
      # its an existing {} that is available when we configure sessions in our app
      render json: user, status: :ok
      #authenticate will use the same hash and salt to the password that was entered and compare it to what the users stored password is
    else 
      render json: "Invalid Credentials", status: :unauthorized
    end

  end

  def destroy
    session.delete(:user_id) # logging our user out by removing the id from our session/ forgetting about our user
  end
end
