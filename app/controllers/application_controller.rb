class ApplicationController < ActionController::Base
  include Application::DeviseHandling

  protect_from_forgery
end
