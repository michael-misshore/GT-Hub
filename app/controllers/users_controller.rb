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
  
  def show
    @user = User.find_by_param(params[:id])
    @title = @user.username
    @tunes = Tune.find_all_by_user_id(@user.id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

end
