class ApplicationController < ActionController::API

  rescue_from StandardError do |e|
    render json: { error_message: e.message }, status: :internal_server_error
  end

  private

  def render_error(error_message, status)
    render json: { success: false, error_message: error_message }, status: status
  end

end
