class Project < ActiveRecord::Base
  
has_many :project_elements
has_many :elements, :through => :project_elements
#accepts_nested_attributes_for :user_projects
  
has_many :user_projects
has_many :users, :through => :user_projects
#,:foreign_key => "user_id",

belongs_to :projecttype
  
attr_accessible :projectname, :projectdescription, :projecttype_id, :user_ids, :element_ids, :elementname



validates_presence_of :projectname
validates_uniqueness_of :projectname



def display_name
  "#{projectname}"
end








#affiche le responsable du projet
def resp
  
@t=UserProject.find(:all, :conditions=> ["project_id= ?",self.id])
unless @t.first.nil?
@t=@t.first.user_id

@t=User.find(:all, :conditions=>["id=?",@t])

@t=@t.first.name
end
 # @t=self.users 
#@l=User.where(  :name => @t.name).all
   #@l= User.find_by_id(@t.id).name
   #@project_id=self.id
   #@user_associated_object= UserProject.find_by_id(@project_id)   
  # if (UserProject[:project_id]=self.id)
   #  read_attribute("id")
   #end   
  # @userassociename=User.find_by_id(@userassoscieid).name
  #def respo
   # @project.write_attribute("projectheader","bl")
#end
  
end


#creer un tableau d'eltname associé pour l'affichage
def elt_asso_name(*p)
   @pe=ProjectElement.find(:all, :conditions=> ["project_id= ?",self.id])
  
  #elements id correspondant à ce projet
     @t=@pe.collect do |el|
         el.element_id
         end
     
     #elements correspondant recuperés dans table element
    @e= @t.collect do |e|
        Element.find(:all, :conditions=>["id=?",e])     
    end
    
    #cree une tableau d'eltname     
    @name=@e.collect do |test|      
     test.collect do |e|
       e.elementname   
      end    
    end
    
    i=0
    t=[]
    @name.each do |n|
        t[i]=n
        i=i+1
        end
  
  for i in 0...t.length
      return *p[i]=t
  end
end

#extrait l'id correspondant a l element pour faire un link_to ds la vue, avec id comme parametre transmis
def detail_element
    @pe=ProjectElement.find(:all, :conditions=> ["project_id= ?",self.id])
  
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
         @i+=Culture.find(:all, :conditions=> ["element_id= ?",e.id] )  #cf culture controller::create
         
       elsif e.elementtype =="3"
          @i+=Extraction.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf extraction controller::create
       end
             
      end    
    end    
     
       #elements id correspondant à ce projet
     @t=@i.collect do |el|
         el.id
         end
     @t
     
  
 
          #cree une table cle, valeur => type d exp , id     
    #@elt_asso=""
    #@type=@e.collect do |test|      
     #test.collect do |e|
      # if e.elementtype =="1"
       #  @i=Culture.find(:all, :conditions=> ["element_id= ?",e.id] )
       #end
        #  @elt_asso+="#{e.elementtype},#{@i}"    
      #end    
    #end    
     # @elt_asso

end

# methode appelle dans project controller pour afficher le detail des elements associes
def choix_controller
     @pe=ProjectElement.find(:all, :conditions=> ["project_id= ?",self.id])
  
  #elements id correspondant à ce projet
     @t=@pe.collect do |el|
         el.element_id
         end
     
     #elements correspondant recuperés dans table element
    @e= @t.collect do |e|
        Element.find(:all, :conditions=>["id=?",e])     
    end
    
      
    
     @g=""
    @type=@e.collect do |test|      
     test.collect do |e|
       if e.elementtype =="1"
         @g+="cultures,"
       elsif e.elementtype =="3"
         @g+="extractions,"
       else @g="je ne sais pas"
       end
     end
    end
    @g.split(",")

    
    
   
   
         
end


end






