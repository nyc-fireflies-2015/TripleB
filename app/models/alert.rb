require 'time_diff'
class Alert < ActiveRecord::Base

  include TimeDiff

  belongs_to :creator, class_name: "User"
  has_one :location, as: :locatable, dependent: :destroy
  has_one :receipt


  validates :description, :creator, presence: true

  def self.by_location(radius, location)
    @all_alerts = Location.within(radius, :origin => location).where(locatable_type: 'Alert').map {|curr_locale| curr_locale.locatable}
    @all_alerts.select {|alert| alert.status == 'incomplete'}
  end


end
