class AlertsController < ApplicationController

  def index
    @alerts = Alert.limit(50).order(created_at: :desc)
  end

  def new
    @alert = Alert.new
  end

  def show
    @alert = Alert.find_by(id: params[:id])
  end

  def create
    if alert = current_user.created_alerts.create(alert_params)
      redirect_to alert
    else
      redirect_to new_alert_path
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    if @alert.destroy
      redirect_to "/alerts"
    else
      redirect_to alerts_path(alert)
    end
  end

  def update
  	@alert = Alert.find(params[:id])
  	if @alert.update_attributes(status: params[:status])
  		redirect_to "/alerts"
  	else
  		redirect_to edit_alert_path(@alert)
  	end
  end

  private

  def alert_params
    params.require(:alert).permit(:creator_id, :mechanic_id, :latitude, :longitude, :status, :description)
  end

end
