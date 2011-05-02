class AddSettingsToTunes < ActiveRecord::Migration
  def self.up
    add_column :tunes, :downforce_f, :int
    add_column :tunes, :downforce_r, :int
    add_column :tunes, :ballast_amount, :int
    add_column :tunes, :ballast_position, :int
    add_column :tunes, :power_limit, :int
    add_column :tunes, :gear_1, :float
    add_column :tunes, :gear_2, :float
    add_column :tunes, :gear_3, :float
    add_column :tunes, :gear_4, :float
    add_column :tunes, :gear_5, :float
    add_column :tunes, :gear_6, :float
    add_column :tunes, :gear_7, :float
    add_column :tunes, :gear_final, :float
    add_column :tunes, :top_speed, :int
    add_column :tunes, :initial_torque_f, :int
    add_column :tunes, :initial_torque_r, :int
    add_column :tunes, :acceleration_sensitivity_f, :int
    add_column :tunes, :acceleration_sensitivity_r, :int
    add_column :tunes, :braking_sensitivity_f, :int
    add_column :tunes, :braking_sensitivity_r, :int
    add_column :tunes, :ride_height_f, :int
    add_column :tunes, :ride_height_r, :int
    add_column :tunes, :spring_rate_f, :float
    add_column :tunes, :spring_rate_r, :float
    add_column :tunes, :dampners_ext_f, :int
    add_column :tunes, :dampners_ext_r, :int
    add_column :tunes, :dampners_comp_f, :int
    add_column :tunes, :dampners_comp_r, :int
    add_column :tunes, :anti_roll_bar_f, :int
    add_column :tunes, :anti_roll_bar_r, :int
    add_column :tunes, :camber_f, :float
    add_column :tunes, :camber_r, :float
    add_column :tunes, :toe_f, :float
    add_column :tunes, :toe_r, :float
    add_column :tunes, :brake_balance_f, :int
    add_column :tunes, :brake_balance_r, :int
    add_column :tunes, :abs, :int
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
    remove_column :tunes, :abs
  end
end