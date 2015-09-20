require 'pry'
class UsersController < ApplicationController

	def new
		@user = User.new()
	end

  def create
  	user = User.new(user_params)
  	if user.save
  		session[:user_id] = user.id
  		redirect_to alerts_path
  	else
      flash[:error] = user.errors.full_messages.to_sentence
  		redirect_to signup_path
  	end
  end

  def show
  	@user = User.find(params[:id])
    @created_alerts = @user.created_alerts
    @alerts = @user.alerts
  end

  def edit
  	@user = User.find(params[:id])
		if !authorized?(@user)
			redirect_to :root
		end
  end

  def update
  	@user = User.find(params[:id])
    if request.xhr?
      @user.update_attributes(latitude: params[:latitude], longitude: params[:longitude])
    else
      if @user.update_attributes(user_params)
    		redirect_to @user
    	else
    		redirect_to edit_user_path(@user)
    	end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username,:password,:first_name,:last_name,:email,:phone,:latitude,:longitude)
  end

end
