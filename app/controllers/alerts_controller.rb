class AlertsController < ApplicationController

  def index
    @alerts = Alert.limit(50).order(created_at: :desc)
  end

  def new
    @alert = Alert.new
    @issues = Issue.all
  end

  def show
    @alert = Alert.find(params[:id])
    # This is using first only because for basic crud walkthough we're only using one issue.  This will be addressed in the future.
    @alert_issue = @alert.alert_issues.first
  end

  def create
    @alert = Alert.new(creator_id: current_user.id, latitude: 0, longitude: 0)
    if @alert.save
      @alert.alert_issues.create(issue_id: params[:issues], description: params[:description])
      redirect_to "/alerts"
    else
      redirect_to "/alerts/new"
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

end
