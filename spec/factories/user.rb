Factory.sequence :email do |n|
  "email#{n}@factory-#{n}.com"
end

Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password  'getmein'
end