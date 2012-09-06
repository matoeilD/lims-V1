class Culture < ActiveRecord::Base
  
  belongs_to :element
  has_many :extractions
  attr_accessible :culture_name, :host_strain, :culture_note, :contaminants
  #accepts_nested_attributes_for :element

#attention cela poserait probleme pour updater notamment
#validates_presence_of :culture_name
#validates_uniqueness_of :culture_name


#see culture form_edit
def display_name
 "#{culture_name}"
end


  
end