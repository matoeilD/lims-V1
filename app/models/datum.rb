class Datum < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_file, :data_name, :sequencing_assoc
  
  validates_presence_of :data_name
validates_uniqueness_of :data_name
end
