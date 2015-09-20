class User < ActiveRecord::Base
  has_secure_password
  has_many :alerts, class_name: 'Alert', foreign_key: :mechanic_id
  has_many :created_alerts, class_name: 'Alert', foreign_key: :creator_id
  has_many :alert_tags
  has_many :tags, through: :alert_tags

  validates :first_name, :last_name, :username, :email, :phone,  presence: true
  validates :email, :username, :phone, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "numbers should be entered with dashes" }

  def full_name
    [first_name, last_name].join(' ')
  end
end
