class RegistrationsController < Devise::RegistrationsController

  respond_to :html, :js

protected

  def after_inactive_sign_up_path_for(resource)
    new_account_session_path
  end

  def after_update_path_for(resource)
    dreams_path
  end

  def update_resource(resource, params)
    updated =
      if needs_password?(params)
        resource.update_with_password(params)
      else
        resource.update_without_password(params)
      end
    flash.now[:notice] = find_message(:updated) if updated
  end

private

  def needs_password?(params)
    params[:password].present?
  end
end
