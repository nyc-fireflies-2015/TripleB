module TimeDiff

	def time_diff
    start_time = self.created_at
    end_time = DateTime.now
    full_diff = TimeDifference.between(start_time, end_time).in_general
    if full_diff[:years] == 1
      "#{full_diff[:years]} year ago"
    elsif full_diff[:years] > 1
      "#{full_diff[:years]} years ago"
    elsif full_diff[:months] == 1
      "#{full_diff[:months]} month ago"
    elsif full_diff[:months] > 1
      "#{full_diff[:months]} months ago"
    elsif full_diff[:days] == 1
      "#{full_diff[:days]} day ago"
    elsif full_diff[:days] > 1
      "#{full_diff[:days]} days ago"
    elsif full_diff[:hours] == 1
      "#{full_diff[:hours]} hour ago"
    elsif full_diff[:hours] > 1
      "#{full_diff[:hours]} hours ago"
    elsif full_diff[:minutes] == 1
      "#{full_diff[:minutes]} minute ago"
    else
      "#{full_diff[:minutes]} minutes ago"
    end
  end
  
end