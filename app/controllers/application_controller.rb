class ApplicationController < ActionController::Base
  include Application::DeviseHandling

  protect_from_forgery

  protected

  def record_not_found
    raise ActiveRecord::RecordNotFound
  end
end
