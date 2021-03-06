module Application
  module DeviseHandling
    extend ActiveSupport::Concern

    included do
      before_filter :configure_permitted_parameters, if: :devise_controller?
      layout :assign_layout
    end

    SIGN_UP_PARAMS = [:first_name, :last_name, :remember_me]
    UPDATE_PARAMS = [:first_name, :last_name]

    protected

    def assign_layout
      if devise_controller?
        'basic'
      else
        'application'
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update).push(*UPDATE_PARAMS)
      devise_parameter_sanitizer.for(:sign_up).push(*SIGN_UP_PARAMS)
    end
  end
end
