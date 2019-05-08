class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :authenticate_user!

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  protect_from_forgery with: :exception

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :address, :phone, :password)}

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :address, :phone, :password, :current_password)}
  end
end
