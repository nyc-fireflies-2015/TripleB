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

  def redirect_deleted_alert
    alert = Alert.find_by(id: params[:id])
    redirect_to alerts_path if alert.nil?
  end

  def redirect_not_signed_in
    alert = Alert.find_by(id: params[:id])
    redirect_to alerts_path unless signed_in?
  end
end
