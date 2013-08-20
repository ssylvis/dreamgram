class SessionsController < ApplicationController
  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    user = User.where('email = ?', email).first
    if user && user.authenticate(password)
      login user
      redirect_to dreams_url
    else
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  def new
  end
end
