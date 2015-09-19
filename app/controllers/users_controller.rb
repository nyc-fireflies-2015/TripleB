class UsersController < ApplicationController

	def new
		@user = User.new()
	end

  def create
  	@user = User.new(user_params)
  	# if user.save
  	# 	session[:user_id] = user.id
  	# 	redirect_to alerts_path
  	# else
  	# 	redirect_to '/signup'
  	# end

    respond_to do |format|
      if @user.save
        # Tell the UserMailer to send a welcome email after save
        UserMailer.welcome_email(@user).deliver
        session[:user_id] = @user.id
 
        format.html { redirect_to alerts_path }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  	@user = current_user
    @created_alerts = @user.created_alerts
    @alerts = @user.alerts
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