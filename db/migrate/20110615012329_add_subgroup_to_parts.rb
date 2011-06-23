class AddSubgroupToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :subgroup, :string, :null => false, :default => ''
    rename_column :parts, :html_ref_id, :settings_div_id
    rename_column :parts, :html_class, :select_class
  end

  def self.down
    remove_column :parts, :subgroup
    rename_column :parts, :settings_div_id, :html_ref_id
    rename_column :parts, :select_class, :html_class
  end
end
