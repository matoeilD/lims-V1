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
  
@t=UserProject.find(:all, :conditions=> ["project_id= ?",self.id])
@t=@t.first.user_id
@t=User.find(:all, :conditions=>["id=?",@t])
@t=@t.first.name


def show_element
    @element=Project.elements
end


  
 # @t=self.users 
#@l=User.where(  :name => @t.name).all
   #@l= User.find_by_id(@t.id).name
   #@project_id=self.id
   #@user_associated_object= UserProject.find_by_id(@project_id)   
  # if (UserProject[:project_id]=self.id)
   #  read_attribute("id")
   #end   
  # @userassociename=User.find_by_id(@userassoscieid).name
  #def respo
   # @project.write_attribute("projectheader","bl")
#end
  
end




end






