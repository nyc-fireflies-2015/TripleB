class WelcomeController < ApplicationController

  def index
    redirect_to alerts_path if signed_in?
  end

end