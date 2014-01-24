class RegistrationsController < Devise::RegistrationsController

protected

  def after_inactive_sign_up_path_for(resource)
    new_account_session_path
  end

  def after_update_path_for(resource)
    edit_account_registration_path
  end

  def update_resource(resource, params)
    if needs_password?(params)
      resource.update_with_password(params)
    else
      resource.update_without_password(params)
    end
  end

private

  def needs_password?(params)
    params[:password].present?
  end
end
