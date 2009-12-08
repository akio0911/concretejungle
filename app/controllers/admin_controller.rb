class AdminController < ApplicationController
  def signin
    if request.post?
      user = User.authenticate(params[:username], params[:password])
      session[:user_id] = user.id
      redirect_to :action => session[:intended_action],
      :controller => session[:intended_controller]
    end
  end

  def signout
    session[:user_id] = nil
    redirect_to '/'
  end

private
  def check_authentication
    unless session[:user_id]
      session[:intended_action] = action_name
      session[:intended_controller] = controller_name
      redirect_to :controller => 'admin',  :action => 'signin'
    end
  end
end
