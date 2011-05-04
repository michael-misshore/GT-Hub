module ApplicationHelper
  
  def display_setting setting
    setting.nil? ? 'Default' : setting
  end
  
end
