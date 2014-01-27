class UsersController < ApplicationController
  before_filter :authenticate_account!

  def show
    @dreams = current_account.dreams.completed(DreamState::ALL)
    @reached_dreams_limit = current_account.reached_dreams_limit?
    flash[:warning] = I18n.t("account.reached_dreams_limit") if current_account.reached_dreams_limit?
  end
end
