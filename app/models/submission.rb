class Submission < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :submission_center, :submission_type, :accession_number, :bioproject_id, :submission_note, :sequencing_id, :submission_number
end
