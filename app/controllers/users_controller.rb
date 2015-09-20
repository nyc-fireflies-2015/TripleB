class UsersController < ApplicationController

	def new
		@user = User.new()
	end

  def create
  	@user = User.new(user_params)

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        session[:user_id] = @user.id

        format.html { redirect_to alerts_path }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html {
          flash[:error] = @user.errors.full_messages.to_sentence
          redirect_to signup_path
        }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
		if !@user
			redirect_to :root
		else
    	@created_alerts = @user.created_alerts
    	@alerts = @user.alerts
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
