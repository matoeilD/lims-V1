class CulturesController < ApplicationController
  # GET /cultures
  # GET /cultures.json
  def index
    @cultures = Culture.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cultures }
    end
  end

  # GET /cultures/1
  # GET /cultures/1.json
  def show
    @culture = Culture.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @culture }
    end
  end

  # GET /cultures/new
  # GET /cultures/new.json
 def new
    @culture = Culture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @culture }
    end
  end

  # GET /cultures/1/edit
  def edit
    @culture = Culture.find(params[:id])
  end

  # POST /cultures
  # POST /cultures.json
  
  #renseigne l'id de l element associé...si culture n est pas sauvé, l'element nouvellement cree est effacé
  def create
    @culture = Culture.new(params[:culture])
    #permet d'associer elt a culture pour projet::detail elt
    @culture.element_id= Element.last.id
    

    respond_to do |format|
      if @culture.save
        
             
        #format.html { redirect_to :controller => 'elements', :action => 'index', notice: 'element culture was successfully created.' }
        
        format.html { redirect_to @culture, notice: 'culture was successfully created.' }
        format.json { render json: @culture, status: :created, location: @culture }
       
      else
        Element.last.destroy
        format.html { render action: "new" }
        format.json { render json: @culture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cultures/1
  # PUT /cultures/1.json
  def update
    @culture = Culture.find(params[:id])

    respond_to do |format|
      if @culture.update_attributes(params[:culture])
        format.html { redirect_to @culture, notice: 'Culture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @culture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cultures/1
  # DELETE /cultures/1.json
  def destroy
    @culture = Culture.find(params[:id])
    @culture.destroy

    respond_to do |format|
      format.html { redirect_to cultures_url }
      format.json { head :no_content }
    end
  end
end
