class DreamsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :maximum_dreams_limit, :only => :create
  before_filter :parse_completed, :only => :update

  def create
    @dream = current_user.dreams.build(params[:dream])
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
    flash[:warning] = "You have reached the dreams limit for the free account." if current_user.reached_dreams_limit?
  end

  def new
    @dream = Dream.new
  end

  def update
    @dream = find_dream(params[:id])
    if @dream.update_attributes(params[:dream])
      redirect_to dreams_url(params.slice(:edit))
    else
      render 'edit'
    end
  end

private

  def find_dream(id)
    current_user.dreams.find(id)
  end

  def maximum_dreams_limit
    raise "You have reached the dreams limit for the free account." if current_user.reached_dreams_limit?
  end

  def parse_completed
    dream = params[:dream]
    if dream[:completed].present?
      completed_at = Time.now if (dream.delete(:completed) == 'true')
      dream[:completed_at] = completed_at
    end
  end
end
