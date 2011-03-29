class AddSettingsToTunes < ActiveRecord::Migration
  def self.up
    add_column :tunes, :downforce_f, :int, :null => false
    add_column :tunes, :downforce_r, :int, :null => false
    add_column :tunes, :ballast_amount, :int, :null => false
    add_column :tunes, :ballast_position, :int, :null => false
    add_column :tunes, :power_limit, :int, :null => false
    add_column :tunes, :gear_1, :float, :null => false
    add_column :tunes, :gear_2, :float, :null => false
    add_column :tunes, :gear_3, :float, :null => false
    add_column :tunes, :gear_4, :float, :null => false
    add_column :tunes, :gear_5, :float, :null => false
    add_column :tunes, :gear_6, :float, :null => false
    add_column :tunes, :gear_7, :float, :null => false
    add_column :tunes, :gear_final, :float, :null => false
    add_column :tunes, :top_speed, :int, :null => false
    add_column :tunes, :initial_torque_f, :int, :null => false
    add_column :tunes, :initial_torque_r, :int, :null => false
    add_column :tunes, :acceleration_sensitivity_f, :int, :null => false
    add_column :tunes, :acceleration_sensitivity_r, :int, :null => false
    add_column :tunes, :braking_sensitivity_f, :int, :null => false
    add_column :tunes, :braking_sensitivity_r, :int, :null => false
    add_column :tunes, :ride_height_f, :int, :null => false
    add_column :tunes, :ride_height_r, :int, :null => false
    add_column :tunes, :spring_rate_f, :float, :null => false
    add_column :tunes, :spring_rate_r, :float, :null => false
    add_column :tunes, :dampners_ext_f, :int, :null => false
    add_column :tunes, :dampners_ext_r, :int, :null => false
    add_column :tunes, :dampners_comp_f, :int, :null => false
    add_column :tunes, :dampners_comp_r, :int, :null => false
    add_column :tunes, :anti_roll_bar_f, :int, :null => false
    add_column :tunes, :anti_roll_bar_r, :int, :null => false
    add_column :tunes, :camber_f, :float, :null => false
    add_column :tunes, :camber_r, :float, :null => false
    add_column :tunes, :toe_f, :float, :null => false
    add_column :tunes, :toe_r, :float, :null => false
    add_column :tunes, :brake_balance_f, :int, :null => false
    add_column :tunes, :brake_balance_r, :int, :null => false
    add_column :tunes, :tires_f, :int, :null => false
    add_column :tunes, :tires_r, :int, :null => false
    add_column :tunes, :abs, :int, :null => false
  end

  def self.down
    remove_column :tunes, :downforce_f
    remove_column :tunes, :downforce_r
    remove_column :tunes, :ballast_amount
    remove_column :tunes, :ballast_position
    remove_column :tunes, :power_limit
    remove_column :tunes, :gear_1
    remove_column :tunes, :gear_2
    remove_column :tunes, :gear_3
    remove_column :tunes, :gear_4
    remove_column :tunes, :gear_5
    remove_column :tunes, :gear_6
    remove_column :tunes, :gear_7
    remove_column :tunes, :gear_final
    remove_column :tunes, :top_speed
    remove_column :tunes, :initial_torque_f
    remove_column :tunes, :initial_torque_r
    remove_column :tunes, :acceleration_sensitivity_f
    remove_column :tunes, :acceleration_sensitivity_r
    remove_column :tunes, :braking_sensitivity_f
    remove_column :tunes, :braking_sensitivity_r
    remove_column :tunes, :ride_height_f
    remove_column :tunes, :ride_height_r
    remove_column :tunes, :spring_rate_f
    remove_column :tunes, :spring_rate_r
    remove_column :tunes, :dampners_ext_f
    remove_column :tunes, :dampners_ext_r
    remove_column :tunes, :dampners_comp_f
    remove_column :tunes, :dampners_comp_r
    remove_column :tunes, :anti_roll_bar_f
    remove_column :tunes, :anti_roll_bar_r
    remove_column :tunes, :camber_f
    remove_column :tunes, :camber_r
    remove_column :tunes, :toe_f
    remove_column :tunes, :toe_r
    remove_column :tunes, :brake_balance_f
    remove_column :tunes, :brake_balance_r
    remove_column :tunes, :tires_f
    remove_column :tunes, :tires_r
    remove_column :tunes, :abs
  end
end