class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def signed_in?
    !!session[:user_id]
  end
  helper_method :signed_in?

  def current_user
    User.find_by(id: session[:user_id])
  end
  helper_method :current_user

  def authorized?(user)
    user == current_user
  end
  helper_method :authorized?
end
