module ApplicationHelper
  def format_date(date)
    date.strftime("%B %d, %Y")
  end
  
  def ucwords(str)
    str.split(' ').select {|w| w.capitalize! || w }.join(' ')
  end
end
