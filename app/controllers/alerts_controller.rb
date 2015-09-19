class AlertsController < ApplicationController

  def index
    # @alerts = Alert.includes(:tags).where("tags.name" => params[:alert][:tags], "status" => "incomplete").limit(50).order(created_at: :desc)
    @alerts = Alert.where(status: "incomplete").limit(50).order(created_at: :desc)
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
      redirect_to new_alert_path
    end
  end

  def update
  	alert = Alert.find_by(id: params[:id])
  	if alert.update_attributes(mechanic: current_user, status: "in progress")
  		redirect_to alerts_path
  	else
  		redirect_to edit_alert_path(alert)
  	end
  end

  private

  def alert_params
    params.require(:alert).permit(:creator_id, :mechanic_id, :latitude, :longitude, :status, :description, :all_tags)
  end

end
