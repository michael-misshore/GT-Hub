module ApplicationHelper
  
  def display_setting(setting)
    setting.nil? ? 'Default' : setting
  end
  
  def format_date(date)
    date.strftime("%B %d, %Y")
  end
  
end
