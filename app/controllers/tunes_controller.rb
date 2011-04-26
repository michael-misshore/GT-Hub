class TunesController < ApplicationController
  
  before_filter :authenticate_user!

  def index
    @tunes = Tune.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tunes }
    end
  end

  def show
    @tune = Tune.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tune }
    end
  end

  def new
    @tune = Tune.new
    @title = 'Tunes'

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tune }
    end
  end

  def edit
    @tune = Tune.find(params[:id])
  end

  # POST /tunes
  # POST /tunes.xml
  def create
    @tune = Tune.new(params[:tune])

    respond_to do |format|
      if @tune.save
        format.html { redirect_to(@tune, :notice => 'Tune was successfully created.') }
        format.xml  { render :xml => @tune, :status => :created, :location => @tune }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tune.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tunes/1
  # PUT /tunes/1.xml
  def update
    @tune = Tune.find(params[:id])

    respond_to do |format|
      if @tune.update_attributes(params[:tune])
        format.html { redirect_to(@tune, :notice => 'Tune was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tune.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tunes/1
  # DELETE /tunes/1.xml
  def destroy
    @tune = Tune.find(params[:id])
    @tune.destroy

    respond_to do |format|
      format.html { redirect_to(tunes_url) }
      format.xml  { head :ok }
    end
  end
end
