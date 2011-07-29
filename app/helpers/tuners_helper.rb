module TunersHelper
  
  def get_groups_section
    #     <% if @tuner.group_id == 0 %>
    #   None | 
    #   <%= link_to 'Create a Group', new_group_path %> | 
    #   <%= link_to 'View Groups', groups_path %>
    # <% else %>
    #   <% if @tuner.group.tuner_ids.include?(current_tuner.id) %>
    #     <b><%= link_to @tuner.group.name, group_path(@tuner.group) %></b>
    #     | <%= link_to 'Edit Group', edit_group_path(@tuner.group) if @tuner.id = @tuner.group.admin_id %>
    #     | <%= link_to 'Leave Group', group_path(@tuner.group) %>
    #   <% elsif !@tuner.group.private %>
    #     <%= link_to 'View Group', group_path(@tuner.group) %>
    #   <% end %>
    # <% end %>
  end
end
