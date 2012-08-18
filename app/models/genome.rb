class Genome < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_assoc, :genome_annotateur, :genome_coverage, :genome_name, :genome_nbcontigs, :genome_nbscaffold, :genome_ncinquante, :genome_params, :genome_ref, :genome_size, :genome_type

 validates_presence_of :data_assoc
 
 #see genome form_edit
def display_name
 "#{genome_name}"
end
 
 # validates_presence_of :genome_name
#validates_uniqueness_of :genome_name
end
