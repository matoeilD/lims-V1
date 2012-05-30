class User < ActiveRecord::Base
has_many :user_projects
has_many :projects, :through => :user_projects

has_many :user_elements
has_many :elements, :through => :user_elements
  
  attr_accessible :email, :firstname, :lastname, :password, :position
end
