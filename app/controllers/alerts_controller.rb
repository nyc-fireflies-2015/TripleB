class AlertsController < ApplicationController

  def new
    @alerts = Alert.all
  end

  def show
    @alert = Alert.find(params[:id])
  end

  def create
    @alert = Alert.build()
    if @alert.save
      redirect_to "show"
    else
      #oh shit
    end
  end

  def destroy
    @alert = Alert.find(params[:id])
    if @alert.destroy
      redirect_to "index"
    else
      #oh shit
    end
  end

end
