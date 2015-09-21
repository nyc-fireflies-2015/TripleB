class AlertsController < ApplicationController
  before_action :redirect_deleted_alert, only: [:show,:update]
  def index
    @popular_tags = Tag.top
    if params[:tag]
      @alerts = Alert.includes(:tags).where("tags.name" => params[:tag], "status" => "incomplete").limit(50).order(created_at: :desc)
    else
      @alerts = Alert.where(status: "incomplete").limit(50).order(created_at: :desc)
    end
  end

  def new
    @alert = Alert.new
  end

  def show
    @alert = Alert.find_by(id: params[:id])
      if @alert.status == 'incomplete'
        render :show_incomplete
      elsif @alert.status == 'in progress'
        render :show_in_progress
      else
        render :show_complete
      end
  end

  def create
    alert = current_user.created_alerts.build(alert_params)
    if alert.save
      redirect_to alert
    else
      flash[:error] = alert.errors.full_messages.to_sentence
      redirect_to new_alert_path
    end
  end

  def update
  	alert = Alert.find_by(id: params[:id])
    # dist = "5 miles"
    if alert.update_attributes(alert_params)
        # This is commented out to prevent texts from being sent during testing
        # TextMessage.send_to_mechanic(alert.creator.full_name, alert.creator.phone,dist) &&
        # TextMessage.send_to_user(alert.mechanic.full_name, alert.mechanic.phone,dist) if alert.status == "in progress"
  		redirect_to alert
  	else
  		redirect_to edit_alert_path(alert)
  	end
  end

  def destroy
    Alert.find_by(id: params[:id]).destroy
    redirect_to alerts_path
  end

  private

  def alert_params
    params.require(:alert).permit(:creator_id, :mechanic_id, :latitude, :longitude, :status, :description, :all_tags)
  end

end
