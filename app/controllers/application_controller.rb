class ApplicationController < ActionController::Base
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
end
