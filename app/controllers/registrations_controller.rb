class RegistrationsController < Devise::RegistrationsController
  layout :assign_layout

  def create
    super do |resource|
      AccountMailer.account_created(resource).deliver
    end
  end

  def destroy
    super do |resource|
      AccountMailer.account_deleted(resource).deliver
    end
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    new_account_session_path
  end

  def after_update_path_for(resource)
    edit_account_registration_path
  end

  def assign_layout
    if action_name == 'edit'
      'application'
    else
      'basic'
    end
  end
end
