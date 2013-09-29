class DreamsController < ApplicationController
  before_filter :login_required
  before_filter :parse_completed, :only => :update

  def create
    @dream = current_user.dreams.build(params[:dream])
    if @dream.save
      redirect_to dreams_url
    else
      render 'new'
    end
  end

  def destroy
    @dream = find_dream(params[:id])
    @dream.destroy

    redirect_to dreams_url(:edit => true)
  end

  def edit
    @dream = find_dream(params[:id])
  end

  def index
    state = DreamState.value_of(params[:state]) || DreamState::ALL
    @dreams = current_user.dreams.completed(state)
  end

  def new
    @dream = Dream.new
  end

  def update
    @dream = find_dream(params[:id])
    if @dream.update_attributes(params[:dream])
      redirect_to dreams_url(params.slice(:edit, :state))
    else
      render 'edit'
    end
  end

private

  def find_dream(id)
    current_user.dreams.find(id)
  end

  def parse_completed
    dream = params[:dream]
    if dream[:completed].present?
      completed_at = Time.now if (dream.delete(:completed) == 'true')
      dream[:completed_at] = completed_at
    end
  end
end
