class Sequencing < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :empcr_id, :distance_cassure, :element_id, :paired_end, :sequencing_name
end
