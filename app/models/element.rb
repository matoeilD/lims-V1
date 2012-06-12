class Element < ActiveRecord::Base
has_many :element_elements
has_many :elements, :through => :element_elements

has_many :user_elements
has_many :users, :through => :user_elements

has_many :project_elements
has_many :projects, :through => :project_elements
  
has_many :experiments

attr_accessible :elementnote, :user_ids, :project_ids, :element_ids, :project_ids
end
