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
  		redirect_to '/signup'
  	end
  end

  def show
  	@user = current_user
  end

  def edit
  	@user = current_user
  end

  def update
  	@user = current_user
  	if @user.update_attributes(user_params)
  		redirect_to @user
  	else
  		redirect_to edit_user_path(@user)
  	end
  end


  private

  def user_params
    params.require(:user).permit(:username,:password,:first_name,:last_name,:email,:phone)
  end

end