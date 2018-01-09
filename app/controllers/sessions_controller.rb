class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(:email => auth['info']['email'])
 
    current_user = @user.id
 
    render 'welcome/home'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
  end
end