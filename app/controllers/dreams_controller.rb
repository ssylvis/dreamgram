class DreamsController < ApplicationController
  DREAM_PARAMS = [:description, :image, :crop_x, :crop_y, :crop_w, :crop_h]

  before_filter :authenticate_user!
  before_filter :maximum_dreams_limit, :only => :create
  before_filter :parse_completed, :only => :update
  before_filter :require_dream_param, :only => [:create, :update]

  def create
    @dream = current_user.dreams.build(create_params)
    if @dream.save
      redirect_to dreams_url(params.slice(:edit))
    else
      render 'new'
    end
  end

  def destroy
    @dream = find_dream(params[:id])
    @dream.destroy
    redirect_to dreams_url(params.slice(:edit))
  end

  def edit
    @dream = find_dream(params[:id])
  end

  def index
    @dreams = current_user.dreams.completed(DreamState::ALL)
    @reached_dreams_limit = current_user.reached_dreams_limit?
    flash[:warning] = I18n.t("user.reached_dreams_limit") if current_user.reached_dreams_limit?
  end

  def new
    @dream = Dream.new
  end

  def update
    @dream = find_dream(params[:id])
    if @dream.update(update_params)
      redirect_to dreams_url(params.slice(:edit))
    else
      render 'edit'
    end
  end

private

  def create_params
    params[:dream].permit(DREAM_PARAMS)
  end

  def find_dream(id)
    current_user.dreams.find(id)
  end

  def maximum_dreams_limit
    raise I18n.t("user.reached_dreams_limit") if current_user.reached_dreams_limit?
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
