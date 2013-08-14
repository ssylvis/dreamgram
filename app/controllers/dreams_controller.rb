class DreamsController < ApplicationController
  def index
    @dreams = Dream.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @dreams }
    end
  end

  def new
    @dream = Dream.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @dream }
    end
  end

  def edit
    @dream = Dream.find(params[:id])
  end

  def create
    @dream = Dream.new(params[:dream])

    respond_to do |format|
      if @dream.save
        format.html { redirect_to dreams_url }
        format.json { render :json => @dream, :status => :created, :location => @dreams }
      else
        format.html { render :action => "new" }
        format.json { render :json => @dream.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @dream = Dream.find(params[:id])

    respond_to do |format|
      if @dream.update_attributes(params[:dream])
        format.html { redirect_to dreams_url }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @dream.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @dream = Dream.find(params[:id])
    @dream.destroy

    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end
end