Factory.sequence :name do |n|
  "group_#{n}"
end

Factory.define :group do |f|
  f.name { Factory.next(:name) }
  f.admin_id 1
  f.private 1
end