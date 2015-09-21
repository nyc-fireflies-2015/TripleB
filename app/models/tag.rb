class Tag < ActiveRecord::Base
  has_many :alert_tags
  has_many :alerts, through: :alert_tags

  validates :name, presence: true

  #ZM: +1
  def self.top
    select('tags.*, COUNT(alert_tags.id) AS tag_count').
      joins(:alert_tags).
      group('tags.id').
      order('tag_count DESC').
      limit(4)
    end
end
