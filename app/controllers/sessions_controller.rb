# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  def new
    @title = 'Sign In'
    super
  end
end