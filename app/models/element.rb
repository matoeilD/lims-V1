class Element < ActiveRecord::Base
has_many :element_elements
has_many :elements, :through => :element_elements

has_many :user_elements
has_many :users, :through => :user_elements

has_many :project_elements , :dependent => :destroy
has_many :projects, :through => :project_elements
  
has_many :experiments
has_one :culture
has_one :extraction, :dependent => :destroy
has_one :library, :dependent => :destroy
has_one :em_pcr, :dependent => :destroy
has_one :sequencing, :dependent => :destroy
has_one :submission, :dependent => :destroy



attr_accessible :elementnote, :user_ids, :project_ids, :element_ids, :experiment_ids, :elementname, :elementtype, :elt

accepts_nested_attributes_for :experiments
accepts_nested_attributes_for :culture


validates_presence_of :elementname
validates_uniqueness_of :elementname

#recupere le id 
#def get_id
  
 #  @i=Culture.find(:all, :conditions=> ["element_id= ?",@element.id] )
  # @t=@i.id
   
#end  


#def project_associe
    
 #  @p=Project.find(self.project_ids)
  
  #end

#delegate :name, :to => :experiments
#delegate :projectname, :to => :project_elements

#def name
 # Element.select("exptype")
#end

end
