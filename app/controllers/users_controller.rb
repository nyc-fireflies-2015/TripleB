class UsersController < ApplicationController

	def new
		@user = User.new()
	end

  def create
  	@user = User.new(user_params)
    # on sign up, create a users location object
    respond_to do |format|
      if @user.save
        current_location = @user.create_location(latitude: params[:location][:latitude], longitude: params[:location][:longitude])
        @user.update_attributes(location_id: current_location.id)
        UserMailer.welcome_email(@user).deliver
        session[:user_id] = @user.id

        format.html { redirect_to alerts_path }
      else
        format.html {
          flash[:error] = @user.errors.full_messages.to_sentence
          redirect_to signup_path
        }
      end
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
		if !@user
			redirect_to :root
		else
    	@alerts = @user.alerts
    	@receipts = @user.receipts
		end
  end

  def edit
  	@user = User.find_by(id: params[:id])
		if !@user || !authorized?(@user)
			redirect_to :root
		end
  end

  def update
  	@user = User.find_by(id: params[:id])
    if request.xhr?
      @user.location.update_attributes(latitude: params[:location][:latitude], longitude: params[:location][:longitude])
      # current_location = @user.create_location(latitude: params[:latitude], longitude: params[:longitude])
      # @user.update_attributes(location_id: current_location.id)
      # @user.update_attributes(latitude: params[:latitude], longitude: params[:longitude])
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
    params.require(:user).permit(:username,:password,:first_name,:last_name,:email,:phone, :bio, :avatar_url)
  end

  def location_params
    params.require(:location).permit(:latitude,:longitude)
  end

end
