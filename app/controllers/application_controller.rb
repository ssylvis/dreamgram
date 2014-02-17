class ApplicationController < ActionController::Base
  include Application::DeviseHandling

  protect_from_forgery

  protected

  def new_session_path(*args)
    new_account_session_path
  end

  def record_not_found
    raise ActiveRecord::RecordNotFound
  end
end
