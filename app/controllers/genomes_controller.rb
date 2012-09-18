class GenomesController < ApplicationController
  
  
   #helper from devise
  before_filter :authenticate_user!
  
      #cancan permet d'afficher uniqeuement si authoriser dans ability.rb
 load_and_authorize_resource
  
  
  # GET /genomes
  # GET /genomes.json
  def index
    @genomes = Genome.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @genomes }
    end
  end

  # GET /genomes/1
  # GET /genomes/1.json
  def show
    @genome = Genome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @genome }
    end
  end

  # GET /genomes/new
  # GET /genomes/new.json
  def new
    @genome = Genome.new
    
       #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds extraction _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @genome }
    end
  end

  # GET /genomes/1/edit
  def edit
    @genome = Genome.find(params[:id])
  end

  # POST /genomes
  # POST /genomes.json
  
  #renseigne l'id de l element associé...si genom n est pas sauvé, l'element nouvellement cree est effacé
  def create
    @genome = Genome.new(params[:genome])
    
    
     @elt=flash[:elt]
    @element = Element.new(@elt)
     @element = Element.new(@elt)
    @element.element_name=@genome.genome_name
    
    #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
      if (@element.projects.blank?)
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved!
        make sure all required fields (*) has been filled '
        return
      else
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved!
        name already used '
        return    
    end
    end
    
       #cf presence of _assoc ds model
    if  ! (@genome.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved!
        make sure all required fields (*) has been filled '
        return
    end
    
    @element.save    
    #@genome.genome_name=flash[:elt][:element_name] 
     #permet d'associer elt a genome pour projet::detail elt
    @genome.element_id= Element.last.id

    respond_to do |format|
      if @genome.save
        format.html { redirect_to @genome, notice: 'Genome was successfully created.' }
        format.json { render json: @genome, status: :created, location: @genome }
      else
       
        format.html { render action: "new" }
        format.json { render json: @genome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /genomes/1
  # PUT /genomes/1.json
  def update
    @genome = Genome.find(params[:id])

    respond_to do |format|
      if @genome.update_attributes(params[:genome])
        format.html { redirect_to @genome, notice: 'Genome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @genome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genomes/1
  # DELETE /genomes/1.json
  def destroy
    @genome = Genome.find(params[:id])
    @genome.destroy

    respond_to do |format|
      format.html { redirect_to genomes_url }
      format.json { head :no_content }
    end
  end
end
