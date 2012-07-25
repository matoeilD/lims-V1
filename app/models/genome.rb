class Genome < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_id, :genome_annotateur, :genome_coverage, :genome_name, :genome_nbcontigs, :genome_nbscaffold, :genome_ncinquante, :genome_params, :genome_ref, :genome_size, :genome_type
end
