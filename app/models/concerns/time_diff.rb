module TimeDiff

	def time_diff
    start_time = self.created_at
    end_time = DateTime.now
    full_diff = TimeDifference.between(start_time, end_time).in_general
    if full_diff[:years] == 1
      "#{full_diff[:years]} year and #{full_diff[:months]} months ago"
    elsif full_diff[:years] > 1
      "#{full_diff[:years]} years and #{full_diff[:months]} months ago"
    elsif full_diff[:months] > 0
      "#{full_diff[:months]} months and #{full_diff[:days]} days ago"
    elsif full_diff[:days] > 0
      "#{full_diff[:days]} days and #{full_diff[:hours]} ago"
    elsif full_diff[:hours] > 0
      "#{full_diff[:hours]} hours and #{full_diff[:minutes]} minutes ago"
    else
      "#{full_diff[:minutes]} minutes ago"
    end
  end
  
end