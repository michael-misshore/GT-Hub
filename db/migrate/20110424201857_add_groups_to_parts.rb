class AddGroupsToParts < ActiveRecord::Migration
  def self.up
    add_column :parts, :group, :string, :null => false
    add_column :parts, :html_class, :string, :null => false
    add_column :parts, :html_ref_id, :string, :null => false
  end

  def self.down
    remove_column :parts, :group
    remove_column :parts, :html_class
    remove_column :parts, :html_ref_id
  end

end
