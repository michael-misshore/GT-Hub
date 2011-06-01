class KarmaPoint < ActiveRecord::Base
  belongs_to :tuners
  belongs_to :tunes
  
end
