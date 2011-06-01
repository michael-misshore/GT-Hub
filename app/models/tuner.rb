class Tuner < ActiveRecord::Base
  belongs_to :group
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either tuner_name or email
  # This is in addition to a real persisted field like 'tuner_name'
  attr_accessor :login
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :tuner_name, :email, :password, :password_confirmation, :remember_me, :login
  
  validates_uniqueness_of :tuner_name, :case_sensitive => false 
    
  def to_param
    tuner_name.downcase
  end
  
  def self.find_by_param(id)
    where(:tuner_name => id).first
  end
  
  def total_karma(tuner_id = nil)
    tuner_id = self.id if (tuner_id.nil?)
    k = KarmaPoint.select("SUM(karma) AS karma").where("tuner_id = ?", tuner_id).group("tuner_id").first
    (k.nil?) ? '0' : k.karma
  end
  
protected

 def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   login = conditions.delete(:login)
   where(conditions).where(["lower(tuner_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
 end
  
end