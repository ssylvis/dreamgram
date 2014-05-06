class UsersController < ApplicationController
  before_filter :find_account

  def show
    @dreams = @account.dreams
    @active_dreams = @dreams.active.order_by_created
    @completed_dreams = @dreams.completed.order_by_completed
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
