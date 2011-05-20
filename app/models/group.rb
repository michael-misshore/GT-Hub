class Group < ActiveRecord::Base
  has_many :tuners
  
  def to_param
    name.downcase
  end
  
  def self.find_by_param(id)
    where(:name => id.downcase).first
  end
end
