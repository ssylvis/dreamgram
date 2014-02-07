class ApplicationController < ActionController::Base
  SIGN_UP_PARAMS = [:name, :remember_me]
  UPDATE_PARAMS = [:name]

  protect_from_forgery

  before_filter :configure_permitted_parameters, if: :devise_controller?

  layout :assign_layout

  protected

  def assign_layout
    if devise_controller?
      'registration'
    else
      'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update).push(*UPDATE_PARAMS)
    devise_parameter_sanitizer.for(:sign_up).push(*SIGN_UP_PARAMS)
  end
end
