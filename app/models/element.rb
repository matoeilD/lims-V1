class Element < ActiveRecord::Base
has_many :element_elements
has_many :elements, :through => :element_elements

has_many :user_elements
has_many :users, :through => :user_elements

has_many :project_elements
has_many :projects, :through => :project_elements
  
has_many :experiments
has_one :culture, :dependent => :destroy


attr_accessible :elementnote, :user_ids, :project_ids, :element_ids, :experiment_ids, :elementname, :elementtype, :elt

accepts_nested_attributes_for :experiments
accepts_nested_attributes_for :culture


validates_presence_of :elementname
validates_uniqueness_of :elementname

  


#def project_associe
    
 #  @p=Project.find(self.project_ids)
  
  #end

#delegate :name, :to => :experiments
#delegate :projectname, :to => :project_elements

#def name
 # Element.select("exptype")
#end

end
