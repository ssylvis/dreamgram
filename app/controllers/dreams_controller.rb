class DreamsController < ApplicationController
  before_filter :login_required

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
    @dreams = current_user.dreams.order('created_at')
  end

  def new
    @dream = Dream.new
  end

  def update
    @dream = find_dream(params[:id])

    if @dream.update_attributes(params[:dream])
      redirect_to dreams_url
    else
      render 'edit'
    end
  end

private

  def find_dream(id)
    current_user.dreams.find(id)
  end

end
