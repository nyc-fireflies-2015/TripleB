class AlertIssue < ActiveRecord::Base
  belongs_to :alert
  belongs_to :issue
end
