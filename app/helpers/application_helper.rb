module ApplicationHelper
  
  def test
    a = "hello"
  end
  
  #retourne les utilisateurs avec le statut (position) "responsable" mais pas pour un projet donné
  def getresponsableUser
    array =Array.new
    
    User.all.each do |u|
      if u.position == "responsable"
         array.push(u.name)
      end
                  end
  return array
  end
  
  #utilisé plus bas
  def modelname_to_tablename(elt_type)
      #  @s=elt_type.capitalize        
      #puts @s[0, @s.length]
      
      if elt_type=="culture"
        @z=Culture
      elsif elt_type=="extraction"
        @z=Extraction
       elsif elt_type=="library"
        @z=Library
        elsif elt_type=="EM_PCR"
        @z=EmPcr
        elsif elt_type=="sequencing"
        @z=Sequencing
        elsif elt_type=="submission"
        @z=Submission        
      else @z="probleme method to_tablename"
      end
       @z
      
  end
  
    # à partir du projet associé,extrait du :controller=> element, permet d afficher les cultures ou extraction ou etc associes a un projet lambda, au moment de la creation d'une extraction/lib/etc...
# pour fonctionner il faudrait recuperer en argument le type d'element et le repercuter plus bas 
def filtre_elt_associe(project_associe_id,elt_type)
  
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
    @g=modelname_to_tablename(elt_type)    
     
    @type=@e.collect do |test|      
     test.collect do |e|
       if e.elementtype ==elt_type
         @i+=@g.find(:all, :conditions=> ["element_id= ?",e.id] )
       end
          
      end    
    end
      
     
       #elements name correspondant à ce projet
     @t=@i.collect do |el|
       if elt_type == "culture"
         el.culture_name
       elsif elt_type == "extraction"
         el.extraction_name
       elsif elt_type == "library"
         el.library_name
       elsif elt_type == "EM_PCR"
         el.EM_PCR_name
       elsif elt_type == "sequencing"
          el.sequencing_name
       elsif elt_type == "submission"
          el.submission_name
       else "error method filtre elt associe"
         end
         end
     @t
     
end

def empty_string #so that nil objject do not mess up the views
  @s=" "
end

 
  
end
