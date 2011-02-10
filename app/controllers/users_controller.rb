class UsersController < ApplicationController  
  
  before_filter :authenticate_user! 
  
  def index
    @title = 'Users'
    @users = User.all
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

end
