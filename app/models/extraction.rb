class Extraction < ActiveRecord::Base
  
  belongs_to :element
  belongs_to :culture
  attr_accessible :culture_assoc, :element_id, :extraction_name, :extraction_note
  
   # validates_presence_of :extraction_name
#validates_uniqueness_of :extraction_name
  
  # deplace ds helper
#def self.culture_associe(project_associe_id)
 #   @pe=ProjectElement.find(:all, :conditions=> ["project_id= ?",project_associe_id])
  
  #elements id correspondant à ce projet
  #   @t=@pe.collect do |el|
   #      el.element_id
    #     end
     
     #elements correspondant recuperés dans table element
    #@e= @t.collect do |e|
     #   Element.find(:all, :conditions=>["id=?",e])     
    #end
    
      
    
    #@i=[]
    #@type=@e.collect do |test|      
    # test.collect do |e|
     #  if e.elementtype =="culture"
      #   @i+=Culture.find(:all, :conditions=> ["element_id= ?",e.id] )
       #end
             
      #end    
    #end    
     
       #elements name correspondant à ce projet
     #@t=@i.collect do |el|
      #   el.culture_name
       #  end
     #@t
     

  
#end
  
  
  
  
end


