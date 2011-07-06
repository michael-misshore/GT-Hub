module TunesHelper
  
  # Returns the 'options' for a part's select box
  def get_part_options_html (parts, selected_parts)
    html = ''
    parts.each do |part|
      rel = (part.settings_div_id.empty?) ? '' : " rel=\"##{part.settings_div_id}\""
      selected = (selected_parts.include?(part.id)) ? ' selected="selected"' : ''
      html << "<option value=\"#{part.id}\"#{rel}#{selected}>#{part.name}</option>"
    end
    html.html_safe
  end
  
  # Gets the options hash
  def get_part_form_options (part)
		options = Hash.new
		options[:rel] = "##{part.settings_div_id}" unless part.settings_div_id.empty? || !part.select_class.empty?
		options[:id] = (part.select_class.empty?) ? "tune_part_ids_#{part.id}" : part.select_class
		options
  end
  
end
