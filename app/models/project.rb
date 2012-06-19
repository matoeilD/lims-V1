class Project < ActiveRecord::Base
  
has_many :project_elements
has_many :elements, :through => :project_elements
#accepts_nested_attributes_for :user_projects
  
has_many :user_projects
has_many :users, :through => :user_projects
#,:foreign_key => "user_id",

belongs_to :projecttype
  
attr_accessible :projectname, :projectdescription, :projecttype_id, :user_ids, :element_ids


def display_name
  "#{projectname}"
end


def resp
  
 # @t=self.users
 
#@l=User.where(  :name => @t.name).all

   #@l= User.find_by_id(@t.id).name
   @user_associated_id= UserProject.find_by_id(self.id).user_id
  # @userassociename=User.find_by_id(@userassoscieid).name
  
end


end






