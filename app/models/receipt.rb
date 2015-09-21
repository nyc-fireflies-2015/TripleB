class Receipt < ActiveRecord::Base
	has_one :location, as: :locatable
	belongs_to :mechanic, class_name: "User"
	belongs_to :alert
end