class AddMoreFieldsToTunes < ActiveRecord::Migration
  def self.up
    add_column :tunes, :performance_points, :integer
    add_column :tunes, :horsepower, :integer
    add_column :tunes, :torque, :integer
    add_column :tunes, :weight, :integer
    
    add_column :tunes, :comments, :text
    
    add_column :tunes, :transmission_type, :string, :default => 'Manual'
    add_column :tunes, :traction_control, :integer
    add_column :tunes, :skid_recovery, :bool, :default => false
    add_column :tunes, :active_steering, :bool, :default => false
    add_column :tunes, :asm, :bool, :default => false
    
    add_index :tunes, :car_id
    add_index :tunes, :track_id
    add_index :tunes, :tuner_id
    add_index :tunes, :tune_type
  end

  def self.down
    remove_column :tunes, :performance_points
    remove_column :tunes, :horsepower
    remove_column :tunes, :torque
    remove_column :tunes, :weight
    
    remove_column :tunes, :comments
    
    remove_column :tunes, :transmission_type
    remove_column :tunes, :traction_control
    remove_column :tunes, :skid_recovery
    remove_column :tunes, :active_steering
    remove_column :tunes, :asm
    
    remove_index :tunes, :car_id
    remove_index :tunes, :track_id
    remove_index :tunes, :tuner_id
    remove_index :tunes, :tune_type
  end
end
