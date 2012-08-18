module ApplicationHelper
  
  
  def addRow
  render :text => "mierda"
  end
  
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
         elsif elt_type=="data"
        @z=Datum
         elsif elt_type=="genome"
        @z=Genome
         elsif elt_type=="metagenome"
        @z=Metagenome
         elsif elt_type=="16s_pyro"
        @z=Seizespyro
         elsif elt_type=="RNAseq"
        @z=Rnaseq
          elsif elt_type=="mass_spectro"
        @z=Spectro
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
       if e.element_type ==elt_type
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
       elsif elt_type == "data"
          el.data_name
       elsif elt_type == "genome"
          el.genome_name
       elsif elt_type == "metagenome"
          el.meta_name
       elsif elt_type == "16s_pyro"
          el.seize_name
       elsif elt_type == "RNAseq"
          el.rnaseq_name
       elsif elt_type == "mass_spectro"
          el.spectro_name
       else "error method filtre elt associe"
         end
         end
     @t
     
end

#refactoring nil
def display_fields_on_views(obj)
  #obj.empty? method would not be defined for class Fixnum // obj.NaN? would not work for date
    if obj.blank? #raccourci de .nil || ou .empty
       @z="</br>"
       raw @z
    else
      return obj
    end  
end
  

def sortable(column, title = nil)
  title ||= column.titleize
  css_class = column == sort_column ? "current #{sort_direction}" : nil
  direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  link_to title, {:sort => column, :direction => direction}, {:class => css_class}
end

def project_progression(p)
if p.choix_controller.include? 'submissions'
   return "class='bar' style= 'width: 100%; ' "


elsif p.choix_controller.include? 'sequencings'
   return "class='bar' style= 'width: 60%; '"
elsif p.choix_controller.include? 'libraries'
   return "class='bar' style= 'width: 40%; '"
elsif p.choix_controller.include? 'em_pcrs'
   return "class='bar' style= 'width: 30%; '"
elsif p.choix_controller.include? 'extractions'
    return "class='bar' style= 'width: 20%; '"
elsif p.choix_controller.include? 'cultures'
  return "class='bar' style= 'width: 10%; '"
end
end
 
def color_bar(p)
if p.choix_controller.include? 'submissions'
      return "class='progress progress-success'"
elsif p.choix_controller.include? 'sequencings'
      return "class='progress progress-inverse'"
elsif p.choix_controller.include? 'libraries'
   return "class='progress progress-danger'"
elsif p.choix_controller.include? 'em_pcrs'
   return "class='progress progress-warning'"

elsif p.choix_controller.include? 'extractions'
   return "class='progress progress-info'"
   
elsif p.choix_controller.include? 'cultures'
  return "class='progress progress-primary'"
 
  end
end

def done?(p)

if p.choix_controller.include? 'submissions'
  @z=	"<span class='badge badge-success'>done</span>"
  raw @z
end
end


  
end
