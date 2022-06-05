class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user
  before_action :update_allowed_parameters, if: :devise_controller?

  private

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :bio, :password, :password_confirmation, :current_password)
    end
  end

  def authenticate_user
    return unless request.headers['Authorization'].present?

    authenticate_or_request_with_http_token do |token|
      jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
      @current_user_id = jwt_payload['id']
    rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      head :unauthorized
    end
  end
end
