class TunesController < ApplicationController
  
  before_filter :authenticate_tuner!, :except => [:index, :show]

  def index
    params['filter'] ||= {}
    params['order_by'] ||= {}
    
    @title = 'Tune Database'
    @tunes = Tune.search(params).page params[:page]
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tunes }
    end
  end

  def show
    @title = 'View Tune'
    @tune = Tune.included.find(params[:id])
    @groups = Part.get_groups_hash()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tune }
    end
  end

  def new
    @title = 'Create Tune'
    @tune = Tune.new
    @groups = Part.get_groups_hash()

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tune }
    end
  end

  def edit    
    @title = 'Edit Tune'
    @tune = Tune.find(params[:id])
    
    redirect_to(tunes_path, :notice => "You are not the tuner for this tune") if @tune && current_tuner.id = @tune.tuner.id
    
    @groups = Part.get_groups_hash()
  end

  # POST /tunes
  # POST /tunes.xml
  def create
    @title = 'Create Tune'
    @tune = Tune.new(params[:tune])
    @groups = Part.get_groups_hash()

    respond_to do |format|
      if @tune.save
        format.html { redirect_to(@tune, :notice => 'Your tune was successfully created.') }
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
    @title = 'Edit Tune'
    @tune = Tune.find(params[:id])
    
    redirect_to(tunes_path, :notice => "You are not the tuner for this tune") if @tune && current_tuner.id = @tune.tuner.id
    
    @groups = Part.get_groups_hash()

    respond_to do |format|
      if @tune.update_attributes(params[:tune])
        format.html { redirect_to(@tune, :notice => 'Your tune was successfully updated.') }
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
  
  # May move to it's own controller
  def add_karma_point
    @tune = Tune.find(params[:id])
    @tune.add_karma_point(current_tuner.id, params[:point])

    respond_to do |format|
      format.json  { render :json => { :total_karma => current_tuner.total_karma, :tune_karma => @tune.karma_sum }, :content_type => "text/html" }
    end
  end
end
