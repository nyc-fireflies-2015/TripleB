class Alert < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_one :location, as: :locatable


  validates :description, :creator, presence: true

  def time_diff
    start_time = self.created_at
    end_time = DateTime.now
    full_diff = TimeDifference.between(start_time, end_time).in_general
    if full_diff[:hours] > 0
      "#{full_diff[:hours]} hours and #{full_diff[:minutes]} minutes ago"
    else
      "#{full_diff[:minutes]} minutes ago"
    end
  end

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end
end
