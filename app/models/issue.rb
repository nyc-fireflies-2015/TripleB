class Issue < ActiveRecord::Base
  has_many :alert_issues
  has_many :alerts, through: :alert_issues
end
