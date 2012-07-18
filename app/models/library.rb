class Library < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :element_id, :extraction_id, :fragmentation, :library_name, :strategy
end
