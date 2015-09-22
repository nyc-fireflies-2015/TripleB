class Location < ActiveRecord::Base
	belongs_to :locatable, polymorphic: true
  after_create do
    location_bearer = self.locatable_type.constantize.find(self.locatable_id)
    location_bearer.update_attributes(location_id: self.id)
  end
	acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

end