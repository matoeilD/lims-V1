class Metagenome < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_assoc, :meta_name, :meta_output, :meta_params, :meta_tools
  
  
  validates_presence_of :data_assoc
  
  
  #see metagenome form_edit
def display_name
 "#{meta_name}"
end
  
end
