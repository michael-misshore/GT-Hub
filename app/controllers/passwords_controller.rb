# app/controllers/passwords_controller.rb
class PasswordsController < Devise::PasswordsController
  def new
    @title = 'Forgot Password'
    super
  end
  
  def edit
    @title = 'Change Password'
    super
  end
  
  def update
    @title = 'Change Password'
    super
  end
  
  def create
    @title = 'Change Password'
    super
  end
  
end