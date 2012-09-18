class EmPcr < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :EM_PCR_name, :PCR_round, :element_id, :library_assoc
  
  
   validates_presence_of :library_assoc

  
  #see empcr form_edit
def display_name
 "#{EM_PCR_name}"
end
  
end
