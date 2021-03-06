class DreamsController < ApplicationController
  DREAM_PARAMS = [:crop_x, :crop_y, :crop_w, :crop_h, :description, :image]

  before_filter :authenticate_account!
  before_filter :find_account
  before_filter :maximum_dreams_limit, :only => :create
  before_filter :parse_completed, :only => :update
  before_filter :require_dream_param, :only => [:create, :update]

  respond_to :html, :js

  def create
    @dream = current_account.dreams.build(create_params)
    if @dream.save
      redirect_to account_root_path
    else
      render 'new'
    end
  end

  def destroy
    @dream = find_dream(params[:id])
    unless @dream.destroy
      flash.now[:alert] = I18n.t(".request_failed")
    end
  end

  def edit
    @dream = find_dream(params[:id])
  end

  def new
    @dream = Dream.new
  end

  def update
    @dream = find_dream(params[:id])
    if @dream.update(update_params)
      respond_with @dream, :location => account_root_path
    else
      flash.now[:alert] = I18n.t(".request_failed")
    end
  end

  private

  def create_params
    params[:dream].permit(DREAM_PARAMS)
  end

  def find_account
    @account = current_account
  end

  def find_dream(id)
    current_account.dreams.find(id)
  end

  def maximum_dreams_limit
    raise I18n.t("account.reached_dreams_limit") if current_account.reached_dreams_limit?
  end

  def parse_completed
    dream = params[:dream]
    if dream[:completed].present?
      completed_at = Time.now if (dream.delete(:completed) == 'true')
      dream[:completed_at] = completed_at
    end
  end

  def require_dream_param
    params.require(:dream)
  end

  def update_params
    params[:dream].permit(DREAM_PARAMS.push(:completed_at))
  end
end
