class Culture < ActiveRecord::Base
  
  belongs_to :element  
  attr_accessible :culturename
  #accepts_nested_attributes_for :element



  
end