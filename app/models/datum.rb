class Datum < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_file, :data_name, :sequencing_assoc
  
   validates_presence_of :sequencing_assoc
  


#see data form_edit
def display_name
 "#{data_name}"
end

end
