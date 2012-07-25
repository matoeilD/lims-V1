class Datum < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_file, :data_name, :sequencing_id
end
