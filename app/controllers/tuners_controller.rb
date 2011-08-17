class TunersController < ApplicationController  
  before_filter :authenticate_tuner!
  
  def index
    @title = 'Tuners'
    @tuners = Tuner.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tuners }
    end
  end
  
  def show
    params['filter'] ||= {}
    params['order_by'] ||= {}
    
    @tuner = Tuner.find_by_param(params[:id])
    @title = "#{@tuner.tuner_name}'s Garage"
    @tunes = @tuner.tunes.search(params).page params[:page]
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tuner }
    end
  end

end
