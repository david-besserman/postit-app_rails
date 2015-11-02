module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def display_time(dt)
    if logged_in? && !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end
    
    dt.strftime("%d/%m/%Y %l:%M%P %Z")
  end
end