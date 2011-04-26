class Tune < ActiveRecord::Base
  belongs_to :car
  belongs_to :track
  belongs_to :user
  has_and_belongs_to_many :parts
  
end
