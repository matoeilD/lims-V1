class SequencingsController < ApplicationController
  
   #helper from devise
  before_filter :authenticate_user!
  
      #cancan permet d'afficher uniqeuement si authoriser dans ability.rb
 load_and_authorize_resource
  
  # GET /sequencings
  # GET /sequencings.json
  def index
    @sequencings = Sequencing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sequencings }
    end
  end

  # GET /sequencings/1
  # GET /sequencings/1.json
  def show
    @sequencing = Sequencing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sequencing }
    end
  end

  # GET /sequencings/new
  # GET /sequencings/new.json
  def new
    @sequencing = Sequencing.new
     
   #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds extraction _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sequencing }
    end
  end

  # GET /sequencings/1/edit
  def edit
    @sequencing = Sequencing.find(params[:id])
  end

  # POST /sequencings
  # POST /sequencings.json
  
   #renseigne l'id de l element associé...si sequencing n est pas sauvé, l'element nouvellement cree est effacé
  
  
  def create
    @sequencing = Sequencing.new(params[:sequencing])
    
     @elt=flash[:elt]
    @element = Element.new(@elt)
    @element.element_name= @sequencing.sequencing_name
    
    #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
      if (@element.projects.blank?)
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved! make sure all required fields (*) has been filled '
        return
      else
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved! name already used '
        return     
    end
    end
    
    
       #cf presence of _assoc ds model
    if  ! (@sequencing.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved! make sure all required fields (*) has been filled '
        return
    end
    
    
    if (@sequencing.paired_end=="no" &&  ! (@sequencing.distance_cassure.blank?))
    redirect_to :controller => 'elements', :action => 'new', :notice => " element has not been saved - 'distance cassure' can be filled only if PET seq "
        return
    
  end
    
    @element.save    
    #@sequencing.sequencing_name=flash[:elt][:element_name] 
    #permet d'associer elt a seq pour projet::detail elt
    @sequencing.element_id= Element.last.id
  
  
  
  
    respond_to do |format|
      if @sequencing.save
        format.html { redirect_to @sequencing, notice: 'Sequencing was successfully created.' }
        format.json { render json: @sequencing, status: :created, location: @sequencing }
      else
    
        format.html { render action: "new" }
        format.json { render json: @sequencing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sequencings/1
  # PUT /sequencings/1.json
  def update
    @sequencing = Sequencing.find(params[:id])

    respond_to do |format|
      if @sequencing.update_attributes(params[:sequencing])
        format.html { redirect_to @sequencing, notice: 'Sequencing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sequencing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequencings/1
  # DELETE /sequencings/1.json
  def destroy
    @sequencing = Sequencing.find(params[:id])
    @sequencing.destroy

    respond_to do |format|
      format.html { redirect_to sequencings_url }
      format.json { head :no_content }
    end
  end
end
