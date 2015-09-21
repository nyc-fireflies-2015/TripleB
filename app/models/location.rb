class Location < ActiveRecord::Base
	belongs_to :locatable, polymorphic: true

	acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude
end