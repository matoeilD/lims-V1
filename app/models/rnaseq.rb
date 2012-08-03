class Rnaseq < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_assoc, :rnaseq_name, :rnaseq_output, :rnaseq_params, :rnaseq_ref, :rnaseq_tablecount, :rnaseq_tools

  validates_presence_of :rnaseq_name
validates_uniqueness_of :rnaseq_name
end
