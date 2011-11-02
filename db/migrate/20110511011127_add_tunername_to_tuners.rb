class AddTunernameToTuners < ActiveRecord::Migration
  def self.up
    add_column :tuners, :tuner_name, :string, :null => false
    
    add_index :tuners, :tuner_name, :unique => true
  end

  def self.down
    remove_index :tuners, :tuner_name
    
    remove_column :tuners, :tuner_name
  end
end
