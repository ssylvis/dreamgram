class ApplicationController < ActionController::Base
  UPDATE_PARAMS = [:name]
  SIGN_UP_PARAMS = [:name, :remember_me]

  protect_from_forgery

  before_filter :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(*UPDATE_PARAMS)
    devise_parameter_sanitizer.for(:sign_up).push(*SIGN_UP_PARAMS)
  end
end
