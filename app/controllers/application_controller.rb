class ApplicationController < ActionController::Base
  protect_from_forgery

  # called an action ->
  def home
   #render a particular view
   render :template => 'hello_world'
  end

end
