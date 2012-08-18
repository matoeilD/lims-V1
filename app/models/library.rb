class Library < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :element_id, :extraction_assoc, :fragmentation, :library_name, :strategy
  
  validates_presence_of :extraction_assoc
  
  #see library form_edit
def display_name
 "#{library_name}"
end
  
   # validates_presence_of :library_name
#validates_uniqueness_of :library_name
end
