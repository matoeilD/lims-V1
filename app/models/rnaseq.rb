class Rnaseq < ActiveRecord::Base
   belongs_to :element  
  attr_accessible :data_assoc, :rnaseq_name, :rnaseq_output, :rnaseq_params, :rnaseq_ref, :rnaseq_tablecount, :rnaseq_tools



validates_presence_of :data_assoc


#see rnaseq form_edit
def display_name
 "#{rnaseq_name}"
end

end
