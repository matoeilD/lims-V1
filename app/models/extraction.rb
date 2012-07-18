class Extraction < ActiveRecord::Base
  
  belongs_to :element 
  attr_accessible :culture_id, :element_id, :extractionname, :extractionnote
  
  # à partir du projet associé,extrait du :controller=> element, permet d afficher les cultures associes a un projet lambda, au moment de la creation d'une extraction
def self.culture_associe(project_associe_id)
    @pe=ProjectElement.find(:all, :conditions=> ["project_id= ?",project_associe_id])
  
  #elements id correspondant à ce projet
     @t=@pe.collect do |el|
         el.element_id
         end
     
     #elements correspondant recuperés dans table element
    @e= @t.collect do |e|
        Element.find(:all, :conditions=>["id=?",e])     
    end
    
      
    
    @i=[]
    @type=@e.collect do |test|      
     test.collect do |e|
       if e.elementtype =="1"
         @i+=Culture.find(:all, :conditions=> ["element_id= ?",e.id] )
       end
             
      end    
    end    
     
       #elements name correspondant à ce projet
     @t=@i.collect do |el|
         el.culturename
         end
     @t
     

  
end
  
  
  
  
end


