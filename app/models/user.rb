class User < ActiveRecord::Base
  has_secure_password
  has_many :alerts, class_name: 'Alert', foreign_key: :mechanic_id
  has_many :created_alerts, class_name: 'Alert', foreign_key: :creator_id
  has_many :alert_tags
  has_many :tags, through: :alert_tags

  validates :first_name, :last_name, :username, :email, :phone,  presence: true
  validates :email, :username, uniqueness: true
end
