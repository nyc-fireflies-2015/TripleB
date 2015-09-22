require 'time_diff'

class User < ActiveRecord::Base
  include TimeDiff

  has_secure_password  

  has_many :alerts, class_name: 'Alert', foreign_key: :creator_id
  has_many :receipts, class_name: 'Receipt', foreign_key: :mechanic_id
  has_one :location, as: :locatable


  validates :first_name, :last_name, :username, :email, :phone,  presence: true
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def full_name
    [first_name, last_name].join(' ')
  end

  
end
