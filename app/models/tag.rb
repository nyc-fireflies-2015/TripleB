class Tag < ActiveRecord::Base
  has_many :alert_tags
  has_many :alerts, through: :alert_tags
end