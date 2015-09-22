class Location < ActiveRecord::Base
	belongs_to :locatable, polymorphic: true

	acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  def self.get_alerts
  	alerts = self.each_with_object([]) do |location, array|
  		if location.locatable_type == "Alert"
  			alerts << location.locatable
  		end
  	end
  	return alerts
  end

end