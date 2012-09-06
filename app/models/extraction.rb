class Extraction < ActiveRecord::Base
  
  belongs_to :element
  belongs_to :culture
  attr_accessible :culture_assoc, :element_id, :extraction_name, :extraction_note
  
  
   validates_presence_of :culture_assoc
   
   #see extraction form_edit
def display_name
 "#{extraction_name}"
end
  
  
  
  
  
  
end


