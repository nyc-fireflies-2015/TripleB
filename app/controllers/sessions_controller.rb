class SessionsController < ApplicationController

  #ZM: Empty Routes  :((()))
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = 'Invalid login information'
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end