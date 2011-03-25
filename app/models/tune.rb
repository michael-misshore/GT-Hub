class Tune < ActiveRecord::Base
  has_one :car
  has_one :track
  has_one :user
  has_and_belongs_to_many :parts
  
end
