class Projecttype < ActiveRecord::Base
  
 has_many :projects
 
  attr_accessible :projecttypename
end
