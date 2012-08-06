class Submission < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :submission_center, :submission_type, :accession_number, :bioproject_id, :submission_note, :sequencing_assoc, :submission_name


#validates_presence_of :submission_name
#validates_uniqueness_of :submission_name
end
