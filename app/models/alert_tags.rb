class AlertTags < ActiveRecord::Base
  belongs_to :alert
  belongs_to :tag
end