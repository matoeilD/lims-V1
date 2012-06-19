class User < ActiveRecord::Base
has_many :user_projects
has_many :projects, :through => :user_projects


has_many :user_elements
has_many :elements, :through => :user_elements
  
attr_accessible :email, :firstname, :name, :password, :position, :project_ids

#accepts_nested_attributes_for :user_elements, :elements

#def display_name
#puts "#{name}"
#end

#scope :firstname



end
