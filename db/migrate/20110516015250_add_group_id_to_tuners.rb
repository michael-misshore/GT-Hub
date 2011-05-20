class AddGroupIdToTuners < ActiveRecord::Migration
  def self.up
    add_column :tuners, :group_id, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :tuners, :group_id
  end
end
