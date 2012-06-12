class User < ActiveRecord::Base
has_many :user_projects
has_many :projects, :through => :user_projects
#,:foreign_key => "project_id",
#accepts_nested_attributes_for :user_projects

has_many :user_elements
has_many :elements, :through => :user_elements
  
attr_accessible :email, :firstname, :name, :password, :position, :project_ids

def display_name
  "#{name}"
end

end
