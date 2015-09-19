class Alert < ActiveRecord::Base
  belongs_to :mechanic, class_name: "User"
  belongs_to :creator, class_name: "User"
  has_many :alert_issues
  has_many :issues, through: :alert_issues

  def time_diff
    start_time = self.created_at
    end_time = DateTime.now
    full_diff = TimeDifference.between(start_time, end_time).in_general
    if full_diff[:hours]
      "#{full_diff[:hours]} hours and #{full_diff[:minutes]} minutes ago"
    else
      "#{full_diff[:minutes]} minutes ago"
    end
  end

end
