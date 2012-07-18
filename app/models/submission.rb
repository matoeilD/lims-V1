class Submission < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :seize_s, :element_id, :genbank_number, :sequencing_id, :submission_name
end
