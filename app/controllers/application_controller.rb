class ApplicationController < ActionController::Base
  protect_from_forgery

  # called an action ->
  def home
   #render a particular view
   render :template => 'hello_world'
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #helper_method means I can call it in other places too!
  helper_method :current_user

end
