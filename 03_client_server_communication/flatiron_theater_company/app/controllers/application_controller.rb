class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

private 

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def record_not_found(error) #.find method and cant find the record with the given id we get the RecordNotFound exception
    render json: {message: error.message}, status: :not_found
  end

end
