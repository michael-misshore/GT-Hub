module TunesHelper
  
  def get_parts_html (tune, groups)
    html = ''
    groups.each do | group, subgroups |
			html << '<div id="' + group.downcase.gsub(/(\s|\/)/, "_") + '">'
				
				subgroups.each do | subgroup |
					html << '<h2>' + subgroup + '</h2>'
					select_box_parts = {}
					Part.find_by_group_subgroup(group, subgroup).each do |part|
						if part.select_class.empty?
							# Options Setup
							options = Hash.new
							options[:rel] = "##{part.settings_div_id}" unless part.settings_div_id.empty?
							options[:id] = "tune_part_ids_#{part.id}" 
							html << '<div class="field"><b>' + label_tag(options[:id], part.name) + '</b><br />'
							html << check_box_tag("tune[part_ids][]", part.id, tune.part_ids.include?(part.id), options)
							html << '</div><br />'
						else
							select_box_parts[part.select_class] = [] if select_box_parts[part.select_class].nil?
							select_box_parts[part.select_class] << part 
						end
					end #Parts
					select_box_parts.each do |select_class, parts|
						# Options Setup
						options = Hash.new
						options[:id] = select_class
						html << '<div class="field"><b>' + label_tag( select_class) + '</b><br>'
            html << select_tag("tune[part_ids][]", get_part_options_html(parts, tune.part_ids), options)
            html << '</div><br />'
					end #Select Box Parts
				end #Subgroups
				
			html << '</div>'
		end #Groups
		html
  end #get_parts_html
  
  def get_part_options_html (parts, selected_parts)
    html = ''
    parts.each do |part|
      rel = (part.settings_div_id.empty?) ? '' : " rel=\"##{part.settings_div_id}\""
      selected = (selected_parts.include?(part.id)) ? ' selected="selected"' : ''
      html << "<option value=\"#{part.id}\"#{rel}#{selected}>#{part.name}</option>"
    end
    html.html_safe
  end
  
end
