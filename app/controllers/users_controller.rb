class UsersController < ApplicationController
  before_filter :find_account

  def show
    @dreams = @account.dreams.completed(DreamState::ALL)
    @reached_dreams_limit = @account.reached_dreams_limit?
    flash[:warning] = I18n.t("account.reached_dreams_limit") if @account.reached_dreams_limit?
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
