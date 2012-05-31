class Project < ActiveRecord::Base
  
has_many :project_elements
has_many :elements, :through => :project_elements
  
has_many :user_projects
has_many :users, :through => :user_projects

  belongs_to :projecttype
  
  attr_accessible :colourcode, :projectdescription, :user_id, :projectname, :projectheader, :projectmember, :projecttypename
end
