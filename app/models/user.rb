class User < ActiveRecord::Base
  has_many :alerts, class_name: 'Alert', foreign_key: :mechanic_id
  has_many :created_alerts, class_name: 'Alert', foreign_key: :creator_id
  has_many :alert_issues, through: :alerts
  has_many :issues, through: :alert_issues
end
