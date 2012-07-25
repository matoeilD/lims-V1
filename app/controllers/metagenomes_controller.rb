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
    
     @project_associe_id=params[:id] # from redirect method of :controller =>elements :action => create va servir dsmetagenome _form view


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
    
     #permet d'associer elt a metagenome pour projet::detail elt
    @metagenome.element_id= Element.last.id

    respond_to do |format|
      if @metagenome.save
        format.html { redirect_to @metagenome, notice: 'Metagenome was successfully created.' }
        format.json { render json: @metagenome, status: :created, location: @metagenome }
      else
        Element.last.destroy
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
