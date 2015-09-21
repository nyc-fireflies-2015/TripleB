class AlertsController < ApplicationController
  before_action :redirect_deleted_alert, only: [:show,:update]

  def index
    @popular_tags = Tag.top
    if params[:tag]
      #ZM: This should be a scope or class method on the alert
      @alerts = Alert.includes(:tags).where("tags.name" => params[:tag], "status" => "incomplete").limit(50).order(created_at: :desc)
    else
      #ZM: This should be a scope or class method on the alert
      @alerts = Alert.where(status: "incomplete").limit(50).order(created_at: :desc)
    end
  end

  def new
    @alert = Alert.new
  end

  def show
    #ZM: Indentation what / although I like how you did this.. I would be careful
    #ZM: with String constants in your  code... incomplete vs  ALERTSTATUS.incomplete
    #ZM: Research ENUM in ruby
    #ZM: http://stackoverflow.com/questions/75759/enums-in-ruby
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

  #ZM: I am updating the alert, if I'm a mechanaic that has said I want to help you
  def update
    #ZM: Find my Alert
  	alert = Alert.find_by(id: params[:id])

    #ZM: Update the Alert(Status, Machance_ID) 
    if alert.update_attributes(alert_params)

      if alert.is_answered? #['has machanic & progress == inprocess']
        #ZM: google is wacky name for the KV here... Maybe Location[:distance] Location[:duration]
        dist = params[:google][:distance]
        dur = params[:google][:duration]
        #TextDoer.help_on_the_way(@alert).deliver_now
        #ZM: Create a TextMessageModule and give it one public facing methods... send
        #ZM: TextMessage.send_recepit(alert,)

        TextMessage.send_to_mechanic(alert.creator.full_name, alert.mechanic.phone, alert.creator.phone,dist,dur) &&
        TextMessage.send_to_user(alert.mechanic.full_name, alert.mechanic.phone,alert.creator.phone,dist,dur)
      end
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
