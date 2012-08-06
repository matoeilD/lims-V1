class Project < ActiveRecord::Base
  
has_many :project_elements, :dependent => :destroy
has_many :elements, :through => :project_elements
#accepts_nested_attributes_for :user_projects
  
has_many :user_projects
has_many :users, :through => :user_projects
#,:foreign_key => "user_id",

belongs_to :projecttype
  
attr_accessible :projectname, :projectdescription, :projecttype_id, :user_ids, :element_ids, :element_name, :numero_smartlab, :numero_id_interne



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


#creer un tableau d'elt associé pour l'affichage et display les attributs qu on veut ds projet.show
def elt_associe(x)
  @name=nil
   @pe=ProjectElement.find(:all, :conditions=> ["project_id= ?",self.id])
  
  #elements id correspondant à ce projet
     @t=@pe.collect do |el|
         el.element_id
         end
     
     #elements correspondant recuperés dans table element
    @e= @t.collect do |e|
        Element.find(:all, :conditions=>["id=?",e])     
    end
    
    #cree une tableau d'eltname ou autre     
    @name=@e.collect do |test|      
     test.collect do |e|
       if x==1
         e.element_name
       elsif x==2
         e.element_type
          elsif x==3
         e.created_at
          elsif x==4
         e.users
       
       end
       
        
      end    
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
       if e.element_type =="culture"
         @i+=Culture.find(:all, :conditions=> ["element_id= ?",e.id] )  #cf culture controller::create
         
       elsif e.element_type =="extraction"
          @i+=Extraction.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf extraction controller::create
       
        elsif e.element_type =="library"
          @i+=Library.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf library controller::create
       
        elsif e.element_type =="EM_PCR"
          @i+=EmPcr.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf EM-PCR controller::create
       
        elsif e.element_type =="sequencing"
          @i+=Sequencing.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf sequencing controller::create
       
        elsif e.element_type =="submission"
          @i+=Submission.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf submission controller::create          
          
        elsif e.element_type =="data"
          @i+=Datum.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf data controller::create
          
        elsif e.element_type =="genome"
          @i+=Genome.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf genome controller::create
        
        elsif e.element_type =="metagenome"
          @i+=Metagenome.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf metagenome controller::create
          
        elsif e.element_type =="16s_pyro"
          @i+=Seizespyro.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf seizespyro controller::create
          
        elsif e.element_type =="RNAseq"
          @i+=Rnaseq.find(:all, :conditions=> ["element_id= ?",e.id] ) #cf rnaseq controller::create
              
       else puts "probleme methode detail_element"
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
       if e.element_type =="culture"
         @g+="cultures,"
       elsif e.element_type =="extraction"
         @g+="extractions,"
         elsif e.element_type =="library"
         @g+="libraries,"
         elsif e.element_type =="EM_PCR"
         @g+="em_pcrs,"
         elsif e.element_type =="sequencing"
         @g+="sequencings,"
         elsif e.element_type =="submission"
         @g+="submissions,"         
         elsif e.element_type =="data"
         @g+="data,"
         elsif e.element_type =="genome"
         @g+="genomes,"
         elsif e.element_type =="metagenome"
         @g+="metagenomes,"
         elsif e.element_type =="16s_pyro"
         @g+="seizespyros,"
         elsif e.element_type =="RNAseq"
         @g+="rnaseqs,"
        elsif e.element_type =="spectro"
         @g+="spectros," 
       else @g="probleme_methode_choix_controller"
       end
     end
    end
    @g.split(",")


    
    
   
   
         
end


end






