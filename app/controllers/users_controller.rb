class UsersController < ApplicationController
  before_filter :find_account

  def show
    @dreams = @account.dreams.order_by_creation
  end

  private

  def find_account
    if params[:uid].nil?
      authenticate_account!
      @account = current_account
    else
      @account = Account.find_by_uid(params[:uid].to_s)
    end
  end
end
