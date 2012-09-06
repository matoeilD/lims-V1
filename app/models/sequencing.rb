class Sequencing < ActiveRecord::Base
  belongs_to :element  
  attr_accessible :empcr_assoc, :distance_cassure, :element_id, :paired_end, :sequencing_name
  
  
  validates_presence_of :empcr_assoc
  
  #see  form_edit
def display_name
 "#{sequencing_name}"
end

end
