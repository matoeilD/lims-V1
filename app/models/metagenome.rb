class Metagenome < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_assoc, :meta_name, :meta_output, :meta_params, :meta_tools
  
    validates_presence_of :meta_name
validates_uniqueness_of :meta_name
end
