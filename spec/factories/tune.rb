Factory.define :tune do |f|
  f.car_id 1
  f.tuner_id 1
  f.track_id 23
  f.horsepower "1"
  f.torque "1"
  f.performance_points "1"
  f.tune_type 'Grip'
  f.association :car
  f.association :track
  f.association :tuner
end