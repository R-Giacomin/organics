class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :category, :address, :email, :password, :photo)}
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:photo])
    # devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :category, :address, :email, :password, :photo)}
  end
end
