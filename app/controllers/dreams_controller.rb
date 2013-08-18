class DreamsController < ApplicationController
  def create
    @dream = Dream.new(params[:dream])

    if @dream.save
      redirect_to dreams_url
    else
      render :action => "new"
    end
  end

  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy

    redirect_to dreams_url(:edit => true)
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def index
    @dreams = Dream.order('created_at')
  end

  def new
    @dream = Dream.new
  end

  def update
    @dream = Dream.find(params[:id])

    if @dream.update_attributes(params[:dream])
      redirect_to dreams_url
    else
      render :action => "edit"
    end
  end
end
