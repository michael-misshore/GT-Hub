Factory.sequence :email do |n|
  "email#{n}@factory-#{n}.com"
end

Factory.sequence :username do |n|
  "user_#{n}"
end

Factory.define :user do |f|
  f.username { Factory.next(:username) }
  f.email { Factory.next(:email) }
  f.password  'getmein'
end