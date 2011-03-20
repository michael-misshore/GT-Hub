# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    @title = 'Sign Up'
    super
  end
  
  def create
    @title = 'Sign Up'
    super
  end
  
  def edit
    @title = 'Edit Profile'
    super
  end
  
  def update
    @title = 'Edit Profile'
    super
  end
end