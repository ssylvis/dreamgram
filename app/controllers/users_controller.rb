class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to dreams_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def new
    @user = User.new
  end
end
