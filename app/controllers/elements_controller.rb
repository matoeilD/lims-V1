class ElementsController < ApplicationController
  # GET /elements
  # GET /elements.json
   helper_method :sort_column, :sort_direction
  
  
  def index
    @elements = Element.order(sort_column + " " + sort_direction)
    @user_elements=UserElement.all
    #@u=User.test
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @elements }
    end
   
   
   
  end
  
  # GET /elements/1
  # GET /elements/1.json
  def show
    @element = Element.find(params[:id])
  
    
     #redirige vers la methode show approprie
    if @element.element_type =="culture"
      @c=Culture.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'cultures', :action => 'show', :id => @c[0].id
      
      
        
   elsif @element.element_type=="extraction"
      
           @c=Extraction.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'extractions', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="library"
        
           @c=Library.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'libraries', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="EM_PCR"
       
           @c=EmPcr.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'em_pcrs', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="sequencing"
        
       @c=Sequencing.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'sequencings', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="submission"
        
         @c=Submission.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'submissions', :action => 'show', :id => @c[0].id       
        
  elsif @element.element_type=="data"
        
         @c=Datum.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'data', :action => 'show', :id => @c[0].id
  
  elsif @element.element_type=="genome"
        
         @c=Genome.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'genomes', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="metagenome"
        
         @c=Metagenome.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'metagenomes', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="16s_pyro"
        
         @c=Seizespyro.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'seizespyros', :action => 'show', :id => @c[0].id
        
  elsif @element.element_type=="RNAseq"
        
         @c=Rnaseq.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'rnaseqs', :action => 'show', :id => @c[0].id
        
   elsif @element.element_type=="mass_spectro"
        
         @c=Spectro.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'spectros', :action => 'show', :id => @c[0].id
        
 

    else redirect_to :action => 'index', :notice => "element type has not been found"
    end
  
  end
    
    
    
    
    
    

  # GET /elements/new
  # GET /elements/new.json
  def new
    @element = Element.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @element }
    end
  end

  # GET /elements/1/edit
  def edit
    @element = Element.find(params[:id])
    @culture = Culture.find(params[:id])
    
 
  end

  
  
  
  
  # POST /elements
  # POST /elements.json
  def create
  
    @element = Element.new(params[:element])
     @e=params[:element]   #pour sauver elt later uniquement si culture ou extract...est sauvé egalement
     
      #permet de filtrer au moment de la creation d'extractions/seq/... , les cultures/ext/... associés au projet
     @current_project_id=params[:element][:project_ids][1]
     @z=@e
        
    
    
    if params[:element][:element_type]=="culture"
      
        redirect_to :controller => 'cultures', :action => 'new', :elt => @e 
        
   elsif params[:element][:element_type]=="extraction"       
       @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over
        redirect_to :controller => 'extractions', :action => 'new', :elt => @z        
        
  elsif params[:element][:element_type]=="library"
         @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over    
        redirect_to :controller => 'libraries', :action => 'new', :elt => @z
        
  elsif params[:element][:element_type]=="EM_PCR"
          @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over      
        redirect_to :controller => 'em_pcrs', :action => 'new', :elt => @z
        
  elsif params[:element][:element_type]=="sequencing"
          @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over   
        redirect_to :controller => 'sequencings', :action => 'new', :elt => @z
        
  elsif params[:element][:element_type]=="submission"
           @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over    
        redirect_to :controller => 'submissions', :action => 'new', :elt => @z      
        
   elsif params[:element][:element_type]=="data"
          @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over     
        redirect_to :controller => 'data', :action => 'new', :elt => @z
        
   elsif params[:element][:element_type]=="genome"
           @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over  
        redirect_to :controller => 'genomes', :action => 'new', :elt => @z
        
   elsif params[:element][:element_type]=="metagenome"
            @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over  
        redirect_to :controller => 'metagenomes', :action => 'new', :elt => @z
        
   elsif params[:element][:element_type]=="16s_pyro"
            @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over  
        redirect_to :controller => 'seizespyros', :action => 'new', :elt => @z
        
   elsif params[:element][:element_type]=="RNAseq"
           @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over    
        redirect_to :controller => 'rnaseqs', :action => 'new', :elt => @z     
   elsif params[:element][:element_type]=="mass_spectro"
           @z.merge!(:cp => @current_project_id) #because only one possible redirect and two symbols to pass over    
        redirect_to :controller => 'spectros', :action => 'new', :elt => @z  

    else redirect_to :action => 'new', :notice => "element type is needed"
    end
  
  end

   

  # PUT /elements/1
  # PUT /elements/1.json
  def update
    @element = Element.find(params[:id])

    respond_to do |format|
      if @element.update_attributes(params[:element])
        format.html { redirect_to @element, notice: 'Element was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @element.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elements/1
  # DELETE /elements/1.json
  def destroy
    @element = Element.find(params[:id])

    @element.destroy

    respond_to do |format|
      format.html { redirect_to elements_url }
      format.json { head :no_content }
    end
  end
  
  
   private
  
  def sort_column
    Element.column_names.include?(params[:sort]) ? params[:sort] : "element_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  
end
