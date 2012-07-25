class Rnaseq < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_id, :rnaseq_name, :rnaseq_output, :rnaseq_params, :rnaseq_ref, :rnaseq_tablecount, :rnaseq_tools
end
