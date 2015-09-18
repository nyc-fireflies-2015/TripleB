class AlertsController < ApplicationController

  def index
    @alerts = Alert.all
  end

  def new
    @alert = Alert.new
    @issues = Issue.all
  end

  def show
    @alert = Alert.find(current_user.id)
  end

  def create
    @alert = Alert.new(creator_id: current_user.id, latitude: 0, longitude: 0)
    if @alert.save
      @alert.alert_issues.create(issue_id: params[:issues], description: params[:description])
      redirect_to "/"
    else
      redirect_to "/alerts/new"
    end
  end

  def destroy
    alert = Alert.find(params[:id])
    if alert.destroy
      redirect_to "/"
    else
      redirect_to alerts_path(alert)
    end
  end

end
