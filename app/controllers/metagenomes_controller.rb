class MetagenomesController < ApplicationController
  # GET /metagenomes
  # GET /metagenomes.json
  def index
    @metagenomes = Metagenome.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @metagenomes }
    end
  end

  # GET /metagenomes/1
  # GET /metagenomes/1.json
  def show
    @metagenome = Metagenome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @metagenome }
    end
  end

  # GET /metagenomes/new
  # GET /metagenomes/new.json
  def new
    @metagenome = Metagenome.new
    
       #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds extraction _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @metagenome }
    end
  end

  # GET /metagenomes/1/edit
  def edit
    @metagenome = Metagenome.find(params[:id])
  end

  # POST /metagenomes
  # POST /metagenomes.json
  
  #renseigne l'id de l element associé...si metage n est pas sauvé, l'element nouvellement cree est effacé
  def create
    @metagenome = Metagenome.new(params[:metagenome])
    
     @elt=flash[:elt]
    @element = Element.new(@elt)
    @element.element_name= @metagenome.meta_name
     #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => 'start again, this name has already been taken'
        return
    end
    @element.save    
    #@metagenome.meta_name=flash[:elt][:element_name] 
    
     #permet d'associer elt a metagenome pour projet::detail elt
    @metagenome.element_id= Element.last.id

    respond_to do |format|
      if @metagenome.save
        format.html { redirect_to @metagenome, notice: 'Metagenome was successfully created.' }
        format.json { render json: @metagenome, status: :created, location: @metagenome }
      else
   
        format.html { render action: "new" }
        format.json { render json: @metagenome.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /metagenomes/1
  # PUT /metagenomes/1.json
  def update
    @metagenome = Metagenome.find(params[:id])

    respond_to do |format|
      if @metagenome.update_attributes(params[:metagenome])
        format.html { redirect_to @metagenome, notice: 'Metagenome was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @metagenome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metagenomes/1
  # DELETE /metagenomes/1.json
  def destroy
    @metagenome = Metagenome.find(params[:id])
    @metagenome.destroy

    respond_to do |format|
      format.html { redirect_to metagenomes_url }
      format.json { head :no_content }
    end
  end
end
