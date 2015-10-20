module ApplicationHelper
  def fix_url(str)
    str.starts_with?('http://') ? str : "http://#{str}"
  end

  def display_time(dt)
    dt.strftime("%d/%m/%Y %l:%M%P %Z")
  end
end
