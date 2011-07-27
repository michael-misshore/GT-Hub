class Tune < ActiveRecord::Base
  belongs_to :car
  belongs_to :track
  belongs_to :tuner
  has_many :karma_points, :dependent => :delete_all
  has_and_belongs_to_many :parts
  
  validates_associated :car, :tuner
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
  
  # validates_numericality_of :downforce_f, :downforce_r, :ballast_amount, :ballast_position, :power_limit, :top_speed, :initial_torque_f, :initial_torque_r, :acceleration_sensitivity_f, :acceleration_sensitivity_r, :braking_sensitivity_f, :braking_sensitivity_r, :ride_height_f, :ride_height_r, :dampners_ext_f, :dampners_ext_r, :dampners_comp_f, :dampners_comp_r, :anti_roll_bar_f, :anti_roll_bar_r, :brake_balance_f, :brake_balance_r, :abs, :only_integer => true, :allow_blank => true
  # validates_numericality_of :gear_1, :gear_2, :gear_3, :gear_4, :gear_5, :gear_6, :gear_7, :gear_final, :spring_rate_f, :spring_rate_r, :camber_f, :camber_r, :toe_f, :toe_r, :allow_blank => true
  
  before_create :add_karma_point
  
  def karma 
    karma_points.inject(0) {|sum, k| sum + k.karma }
  end
  
  def add_karma_point(karma_point = 1)
    # We need to remove the existing karma for a tuner.
    karma_points.delete(karma_points.find(:all, :conditions => ["tuner_id = ?", tuner_id]))
    karma_points << KarmaPoint.new(:tuner_id => tuner_id, :karma => karma_point)
  end
  
  def self.search (params)
    params['filter'].inject(joins(:car)) do |combined_scope, (column, value)|
      value.present? ? combined_scope.where("#{column.gsub('_', '.')} = ?", value) : combined_scope
    end
  end
end 