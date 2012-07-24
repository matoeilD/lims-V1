class EmPcr < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :EM_PCR_name, :PCR_round, :element_id, :library_id
  
end
