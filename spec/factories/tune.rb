Factory.define :tune do |f|
  f.car_id 1
  f.tuner_id 1
  f.track_id 23
  f.tune_type 'Grip'
  f.association :car
  f.association :track
  f.association :tuner
end