class ExtractionsController < ApplicationController
  # GET /extractions
  # GET /extractions.json
  def index
    @extractions = Extraction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @extractions }
    end
  end

  # GET /extractions/1
  # GET /extractions/1.json
  def show
    @extraction = Extraction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @extraction }
    end
  end

  # GET /extractions/new
  # GET /extractions/new.json
  def new
    @extraction = Extraction.new
    @project_associe_id=params[:id] # from redirect method of :controller =>elements :action => create va servir ds extraction _form view

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @extraction }
    end
  end

  # GET /extractions/1/edit
  def edit
    @extraction = Extraction.find(params[:id])
  end

  # POST /extractions
  # POST /extractions.json
  
  #renseigne l'id de l element associé...si extraction n est pas sauvé, l'element nouvellement cree est effacé
  def create
    @extraction = Extraction.new(params[:extraction])
     #permet d'associer elt a extraction pour projet::detail elt
    @extraction.element_id= Element.last.id

    respond_to do |format|
      if @extraction.save
        format.html { redirect_to @extraction, notice: 'Extraction was successfully created.' }
        format.json { render json: @extraction, status: :created, location: @extraction }
      else
        Element.last.destroy
        format.html { render action: "new" }
        format.json { render json: @extraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /extractions/1
  # PUT /extractions/1.json
  def update
    @extraction = Extraction.find(params[:id])

    respond_to do |format|
      if @extraction.update_attributes(params[:extraction])
        format.html { redirect_to @extraction, notice: 'Extraction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @extraction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extractions/1
  # DELETE /extractions/1.json
  def destroy
    @extraction = Extraction.find(params[:id])
    @extraction.destroy

    respond_to do |format|
      format.html { redirect_to extractions_url }
      format.json { head :no_content }
    end
  end
end