class Element < ActiveRecord::Base
#has_many :element_elements
#has_many :elements, :through => :element_elements

has_many :user_elements, :dependent => :destroy
has_many :users, :through => :user_elements


has_many :project_elements , :dependent => :destroy
has_many :projects, :through => :project_elements
  
#has_many :experiments
has_one :culture, :dependent => :destroy
has_one :extraction, :dependent => :destroy
has_one :library, :dependent => :destroy
has_one :em_pcr, :dependent => :destroy
has_one :sequencing, :dependent => :destroy
has_one :submission, :dependent => :destroy

has_one :datum, :dependent => :destroy
has_one :genome, :dependent => :destroy
has_one :metagenome, :dependent => :destroy
has_one :seizespyro, :dependent => :destroy
has_one :rnaseq, :dependent => :destroy
has_one :spectro, :dependent => :destroy


attr_accessible :element_note, :user_ids, :project_ids, :element_name, :element_type, :element_date

#accepts_nested_attributes_for :experiments
#accepts_nested_attributes_for :culture

validates_presence_of :element_type
validates_presence_of :projects
validates_presence_of :element_name
validates_uniqueness_of :element_name

#cf element_controller and element index view
def self.search(search)
  if search
    where('element_name LIKE ?', "%#{search}%")
  else
    scoped
  end
end




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
