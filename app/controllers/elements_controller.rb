class ElementsController < ApplicationController
  # GET /elements
  # GET /elements.json
  def index
    @elements = Element.all
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
  end

  
  
  
  
  # POST /elements
  # POST /elements.json
  def create
  
    @element = Element.new(params[:element])    
    #render :text => params    
    if params[:element][:element_type]=="culture"
         @element.save
       
        redirect_to :controller => 'cultures', :action => 'new'
      
      
        
   elsif params[:element][:element_type]=="extraction"
        @element.save
        #permet de filtrer au moment de la creation d'extractions , les cultures associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'extractions', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:element_type]=="library"
        @element.save
        #permet de filtrer au moment de la creation de lib , les extract associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'libraries', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:element_type]=="EM_PCR"
        @element.save
        #permet de filtrer au moment de la creation d'pcr , les lib associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'em_pcrs', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:element_type]=="sequencing"
        @element.save
        #permet de filtrer au moment de la creation d'sq , les pcr associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'sequencings', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:element_type]=="submission"
        @element.save
        #permet de filtrer au moment de la creation de submis , les seq associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'submissions', :action => 'new', :id => @current_project_id       
        
   elsif params[:element][:element_type]=="data"
        @element.save
        #permet de filtrer au moment de la creation d'data , les seq associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'data', :action => 'new', :id => @current_project_id
        
   elsif params[:element][:element_type]=="genome"
        @element.save
        #permet de filtrer au moment de la creation d'genom , les datas associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'genomes', :action => 'new', :id => @current_project_id
        
   elsif params[:element][:element_type]=="metagenome"
        @element.save
        #permet de filtrer au moment de la creation d'metag , les datas associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'metagenomes', :action => 'new', :id => @current_project_id
        
   elsif params[:element][:element_type]=="16s_pyro"
        @element.save
        #permet de filtrer au moment de la creation d'seizespyro , les datas associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'seizespyros', :action => 'new', :id => @current_project_id
        
   elsif params[:element][:element_type]=="RNAseq"
        @element.save
        #permet de filtrer au moment de la creation d'rnaseq , les datas associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'rnaseqs', :action => 'new', :id => @current_project_id     
 

    else redirect_to :action => 'new', :notice => "element type is needed"
    end
  
  end

   #def new_culture
    # @culture= Culture.new
    # @culture= Culture.new(params[:culture])
     
     #respond_to do |format|
      #if @culture.save
       # @element.save
        #format.html { redirect_to @element, notice: 'element was successfully created.' }
        #format.json { render json: @element, status: :created, location: @element }
       
      #else
       # format.html { render action: "new" }
        #format.json { render json: @element.errors, status: :unprocessable_entity }
     # end
    #end
   #end

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
end
