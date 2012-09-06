class Spectro < ActiveRecord::Base
  belongs_to :element 
  attr_accessible :analyse_type, :attached_files, :comments, :culture_assoc, :element_id, :gel_number, :probe_number, :procedure, :sample_type, :samples_number, :spectro_name


 validates_presence_of :culture_assoc
 
 #see  form_edit
def display_name
 "#{spectro_name}"
end
 

end
