class Library < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :element_id, :extraction_assoc, :fragmentation, :library_name, :strategy
  
    validates_presence_of :library_name
validates_uniqueness_of :library_name
end
