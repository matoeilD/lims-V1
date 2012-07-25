class SeizespyrosController < ApplicationController
  # GET /seizespyros
  # GET /seizespyros.json
  def index
    @seizespyros = Seizespyro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @seizespyros }
    end
  end

  # GET /seizespyros/1
  # GET /seizespyros/1.json
  def show
    @seizespyro = Seizespyro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @seizespyro }
    end
  end

  # GET /seizespyros/new
  # GET /seizespyros/new.json
  def new
    @seizespyro = Seizespyro.new
    
     @project_associe_id=params[:id] # from redirect method of :controller =>elements :action => create va servir ds seizespyro _form view


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @seizespyro }
    end
  end

  # GET /seizespyros/1/edit
  def edit
    @seizespyro = Seizespyro.find(params[:id])
  end

  # POST /seizespyros
  # POST /seizespyros.json
  
  #renseigne l'id de l element associé...si seizes n est pas sauvé, l'element nouvellement cree est effacé
  def create
    @seizespyro = Seizespyro.new(params[:seizespyro])
    
      #permet d'associer elt a seizespyro pour projet::detail elt
    @seizespyro.element_id= Element.last.id

    respond_to do |format|
      if @seizespyro.save
        format.html { redirect_to @seizespyro, notice: 'Seizespyro was successfully created.' }
        format.json { render json: @seizespyro, status: :created, location: @seizespyro }
      else
        Element.last.destroy
        format.html { render action: "new" }
        format.json { render json: @seizespyro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /seizespyros/1
  # PUT /seizespyros/1.json
  def update
    @seizespyro = Seizespyro.find(params[:id])

    respond_to do |format|
      if @seizespyro.update_attributes(params[:seizespyro])
        format.html { redirect_to @seizespyro, notice: 'Seizespyro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @seizespyro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seizespyros/1
  # DELETE /seizespyros/1.json
  def destroy
    @seizespyro = Seizespyro.find(params[:id])
    @seizespyro.destroy

    respond_to do |format|
      format.html { redirect_to seizespyros_url }
      format.json { head :no_content }
    end
  end
end
