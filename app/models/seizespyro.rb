class Seizespyro < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_assoc, :seize_name, :seize_output, :seize_params, :seize_tools
  
  validates_presence_of :data_assoc
  
  #see seize form_edit
def display_name
 "#{seize_name}"
end
 #   validates_presence_of :seize_name
#validates_uniqueness_of :seize_name
end
