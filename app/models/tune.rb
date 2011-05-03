class Tune < ActiveRecord::Base
  belongs_to :car
  belongs_to :track
  belongs_to :user
  has_and_belongs_to_many :parts

  validates_associated :car
  validates_associated :user
  validates_inclusion_of :tune_type, :in => %w(Grip Drift Drag)
  validates_numericality_of :downforce_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :downforce_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :ballast_amount, :only_integer => true, :allow_blank => true
  validates_numericality_of :ballast_position, :only_integer => true, :allow_blank => true
  validates_numericality_of :power_limit, :only_integer => true, :allow_blank => true
  validates_numericality_of :gear_1, :allow_blank => true
  validates_numericality_of :gear_2, :allow_blank => true
  validates_numericality_of :gear_3, :allow_blank => true
  validates_numericality_of :gear_4, :allow_blank => true
  validates_numericality_of :gear_5, :allow_blank => true
  validates_numericality_of :gear_6, :allow_blank => true
  validates_numericality_of :gear_7, :allow_blank => true
  validates_numericality_of :gear_final, :allow_blank => true
  validates_numericality_of :top_speed, :only_integer => true, :allow_blank => true
  validates_numericality_of :initial_torque_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :initial_torque_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :acceleration_sensitivity_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :acceleration_sensitivity_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :braking_sensitivity_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :braking_sensitivity_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :ride_height_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :ride_height_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :spring_rate_f, :allow_blank => true
  validates_numericality_of :spring_rate_r, :allow_blank => true
  validates_numericality_of :dampners_ext_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :dampners_ext_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :dampners_comp_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :dampners_comp_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :anti_roll_bar_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :anti_roll_bar_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :camber_f, :allow_blank => true
  validates_numericality_of :camber_r, :allow_blank => true
  validates_numericality_of :toe_f, :allow_blank => true
  validates_numericality_of :toe_r, :allow_blank => true
  validates_numericality_of :brake_balance_f, :only_integer => true, :allow_blank => true
  validates_numericality_of :brake_balance_r, :only_integer => true, :allow_blank => true
  validates_numericality_of :abs, :only_integer => true, :allow_blank => true
  
end 