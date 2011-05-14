Factory.sequence :email do |n|
  "email#{n}@factory-#{n}.com"
end

Factory.sequence :tuner_name do |n|
  "tuner_#{n}"
end

Factory.define :tuner do |f|
  f.tuner_name { Factory.next(:tuner_name) }
  f.email { Factory.next(:email) }
  f.password  'getmein'
end