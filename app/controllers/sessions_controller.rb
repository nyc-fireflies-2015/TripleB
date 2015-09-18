class SessionsController < ApplicationController

<<<<<<< HEAD
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to alerts_path
=======
  def create
    user = User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:username])
      session[:user_id] = user.id
      redirect_to
>>>>>>> 767ec1b0d029ec3e2cd00909f2c8968d237839d1
    else
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
<<<<<<< HEAD
=======

  private
  def session_params
    params.require(:session).permit(:username,:password)
  end

>>>>>>> 767ec1b0d029ec3e2cd00909f2c8968d237839d1
end