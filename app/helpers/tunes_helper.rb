module TunesHelper
  
  # Returns the 'options' for a part's select box
  def get_part_options_html (parts, selected_parts)
    html = '<option value=""> - Select a Part - </option>'
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
  
  def listing_header (name, value, title = nil)
    title ||= ucwords(name)
    html = hidden_field_tag("order_by[#{name}]", value, {:class => 'order_by'})
    html << link_to("#{title} #{value}", '#', {:onclick => "order_tunes('#order_by_#{name}');"})
  end
  
  def display_setting(setting)
    setting.nil? ? 'Default' : setting
  end
  
  def display_basic_info(basic_info)
    if basic_info.nil?
      'None Specified'
    elsif basic_info === false || basic_info === 0
      'Off'
    else
      basic_info
    end
  end
  
end
