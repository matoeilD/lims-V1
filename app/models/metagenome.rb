class Metagenome < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_id, :meta_name, :meta_output, :meta_params, :meta_tools
end
