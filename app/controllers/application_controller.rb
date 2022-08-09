class ApplicationController < ActionController::API
  # this code means whenever we get a not destroyed error in any controller method then the not_destroyed method shd fire
  #
  rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed
  rescue_from ActiveRecord::RecordNotFound, with: :not_found


  private
  def not_destroyed(e)
    render json: { errors: e.record.errors }, status: :unprocessable_entity
  end

  def not_found(err)
    render json: { error: { message: err.message } }, status: :not_found
  end
end
