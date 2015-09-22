class AlertsController < ApplicationController
  before_action :redirect_deleted_alert, only: [:show,:update]

  def index
    # @alerts = Alert.where(status: "incomplete").limit(50).order(created_at: :desc)
     @locations = Location.within(1000, :origin => current_user.location)
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
    alert = current_user.alerts.build(alert_params)
    if alert.save
      location = alert.create_location(location_params)
      alert.update_attributes(location_id: location.id)
      redirect_to alert
    else
      flash[:error] = alert.errors.full_messages.to_sentence
      redirect_to new_alert_path
    end
  end

  def update
    alert = Alert.find_by(id: params[:id])
    receipt = alert.build_receipt(receipt_params)
    if alert.update_attributes(alert_params)
      if receipt.save && alert.status == 'in progress'
        mechanic_location = receipt.create_location(mechanic_params)
        receipt.update_attributes(location_id: mechanic_location.id)
      require 'pry';binding.pry
        dist = params[:receipt][:distance]
        dur = params[:receipt][:duration]
        # TextMessage.send_to_mechanic(alert.creator.full_name, alert.mechanic.phone, alert.creator.phone,dist,dur) &&
        # TextMessage.send_to_user(alert.mechanic.full_name, alert.mechanic.phone,alert.creator.phone,dist,dur)
        redirect_to alert
      elsif alert.status == 'incomplete'
        alert.receipt.destroy
        redirect_to alert
      else
        redirect_to alert
      end
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
    params.require(:alert).permit(:creator_id, :status, :description)
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude)
  end

  def receipt_params
    params.require(:receipt).permit(:mechanic_id, :distance, :duration)
  end

  def mechanic_params
    params.require(:mechanic).permit(:latitude, :longitude)
  end

end
