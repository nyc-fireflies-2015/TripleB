class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:username])
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

  private
  def session_params
    params.require(:session).permit(:username,:password)
  end

end