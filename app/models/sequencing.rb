class Sequencing < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :empcr_assoc, :distance_cassure, :element_id, :paired_end, :sequencing_name
  
  #  validates_presence_of :sequencing_name
#validates_uniqueness_of :sequencing_name
end
