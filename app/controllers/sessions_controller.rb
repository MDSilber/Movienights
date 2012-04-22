class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])

    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to "/users", :notice => "Logged in!"
    else
      flash[:alert] = "Invalid email/password combination"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login", :notice => "Logged out!"
  end
end
