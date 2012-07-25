class RnaseqsController < ApplicationController
  # GET /rnaseqs
  # GET /rnaseqs.json
  def index
    @rnaseqs = Rnaseq.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rnaseqs }
    end
  end

  # GET /rnaseqs/1
  # GET /rnaseqs/1.json
  def show
    @rnaseq = Rnaseq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rnaseq }
    end
  end

  # GET /rnaseqs/new
  # GET /rnaseqs/new.json
  def new
    @rnaseq = Rnaseq.new
    
     @project_associe_id=params[:id] # from redirect method of :controller =>elements :action => create va servir ds rnaseq _form view


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rnaseq }
    end
  end

  # GET /rnaseqs/1/edit
  def edit
    @rnaseq = Rnaseq.find(params[:id])
  end

  # POST /rnaseqs
  # POST /rnaseqs.json
  
  #renseigne l'id de l element associé...si rnaseq n est pas sauvé, l'element nouvellement cree est effacé
  def create
    @rnaseq = Rnaseq.new(params[:rnaseq])
    
    #permet d'associer elt a rnaseq pour projet::detail elt
    @rnaseq.element_id= Element.last.id

    respond_to do |format|
      if @rnaseq.save
        format.html { redirect_to @rnaseq, notice: 'Rnaseq was successfully created.' }
        format.json { render json: @rnaseq, status: :created, location: @rnaseq }
      else
        Element.last.destroy
        format.html { render action: "new" }
        format.json { render json: @rnaseq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rnaseqs/1
  # PUT /rnaseqs/1.json
  def update
    @rnaseq = Rnaseq.find(params[:id])

    respond_to do |format|
      if @rnaseq.update_attributes(params[:rnaseq])
        format.html { redirect_to @rnaseq, notice: 'Rnaseq was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rnaseq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rnaseqs/1
  # DELETE /rnaseqs/1.json
  def destroy
    @rnaseq = Rnaseq.find(params[:id])
    @rnaseq.destroy

    respond_to do |format|
      format.html { redirect_to rnaseqs_url }
      format.json { head :no_content }
    end
  end
end
