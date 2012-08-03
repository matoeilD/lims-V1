class EmPcr < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :EM_PCR_name, :PCR_round, :element_id, :library_assoc
  
validates_presence_of :EM_PCR_name
validates_uniqueness_of :EM_PCR_name
  
end
