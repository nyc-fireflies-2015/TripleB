class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to alerts_path
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end