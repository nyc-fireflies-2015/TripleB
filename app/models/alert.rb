class Alert < ActiveRecord::Base
  belongs_to :mechanic, class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :alert_issues
  has_many :issues, through: :alert_issues
end
