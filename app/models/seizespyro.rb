class Seizespyro < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_id, :seize_name, :seize_output, :seize_params, :seize_tools
end
