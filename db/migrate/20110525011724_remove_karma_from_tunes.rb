class RemoveKarmaFromTunes < ActiveRecord::Migration
  def self.up
    remove_column :tunes, :karma
  end

  def self.down
    add_column :tunes, :karma, :integer
  end
end
