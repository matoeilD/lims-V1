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
    if @element.elementtype =="culture"
      @c=Culture.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'cultures', :action => 'show', :id => @c[0].id
      
      
        
   elsif @element.elementtype=="extraction"
      
           @c=Extraction.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'extractions', :action => 'show', :id => @c[0].id
        
  elsif @element.elementtype=="library"
        
           @c=Library.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'libraries', :action => 'show', :id => @c[0].id
        
  elsif @element.elementtype=="EM_PCR"
       
           @c=EmPcr.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'em_pcrs', :action => 'show', :id => @c[0].id
        
  elsif @element.elementtype=="sequencing"
        
       @c=Sequencing.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'sequencings', :action => 'show', :id => @c[0].id
        
  elsif @element.elementtype=="submission"
        
         @c=Submission.find(:all, :conditions=> ["element_id= ?",@element.id] )     
       
        redirect_to :controller => 'submissions', :action => 'show', :id => @c[0].id
        
 

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
    if params[:element][:elementtype]=="culture"
         @element.save
       
        redirect_to :controller => 'cultures', :action => 'new'
      
      
        
   elsif params[:element][:elementtype]=="extraction"
        @element.save
        #permet de filtrer au moment de la creation d'extractions , les cultures associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'extractions', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:elementtype]=="library"
        @element.save
        #permet de filtrer au moment de la creation d'extractions , les cultures associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'libraries', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:elementtype]=="EM_PCR"
        @element.save
        #permet de filtrer au moment de la creation d'extractions , les cultures associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'em_pcrs', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:elementtype]=="sequencing"
        @element.save
        #permet de filtrer au moment de la creation d'extractions , les cultures associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'sequencings', :action => 'new', :id => @current_project_id
        
  elsif params[:element][:elementtype]=="submission"
        @element.save
        #permet de filtrer au moment de la creation d'extractions , les cultures associés au projet
        @current_project_id=params[:element][:project_ids][1]        
        redirect_to :controller => 'submissions', :action => 'new', :id => @current_project_id
        
 

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
