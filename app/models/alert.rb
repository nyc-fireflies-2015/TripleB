class Alert < ActiveRecord::Base
  belongs_to :mechanic, class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :alert_tags
  has_many :tags, through: :alert_tags

  validates :description, :creator, presence: true
end
