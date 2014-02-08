class ErrorsController < ApplicationController
  layout 'registration'

  def internal_error
    render '500', :status => 500
  end

  def not_found
    render '404', :status => 404
  end
end
