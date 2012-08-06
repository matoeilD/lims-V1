class EmPcrsController < ApplicationController
  # GET /em_pcrs
  # GET /em_pcrs.json
  def index
    @em_pcrs = EmPcr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @em_pcrs }
    end
  end

  # GET /em_pcrs/1
  # GET /em_pcrs/1.json
  def show
    @em_pcr = EmPcr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @em_pcr }
    end
  end

  # GET /em_pcrs/new
  # GET /em_pcrs/new.json
  def new
    @em_pcr = EmPcr.new
    
      #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds extraction _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @em_pcr }
    end
  end

  # GET /em_pcrs/1/edit
  def edit
    @em_pcr = EmPcr.find(params[:id])
  end

  # POST /em_pcrs
  # POST /em_pcrs.json
 
  
   #renseigne l'id de l element associé...si em-pcr n est pas sauvé, l'element nouvellement cree est effacé
  
  def create
    @em_pcr = EmPcr.new(params[:em_pcr])
    
    
    @elt=flash[:elt]
    @element = Element.new(@elt)
     @element.element_name=@em_pcr.EM_PCR_name
      #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => 'start again, this name has already been taken'
        return
    end
     
    @element.save    
   # @em_pcr.EM_PCR_name=flash[:elt][:element_name] 
    
    
    
    
     #permet d'associer elt a em_pcr pour projet::detail elt
    @em_pcr.element_id= Element.last.id

    respond_to do |format|
      if @em_pcr.save
        format.html { redirect_to @em_pcr, notice: 'Em pcr was successfully created.' }
        format.json { render json: @em_pcr, status: :created, location: @em_pcr }
      else
     
        format.html { render action: "new" }
        format.json { render json: @em_pcr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /em_pcrs/1
  # PUT /em_pcrs/1.json
  def update
    @em_pcr = EmPcr.find(params[:id])

    respond_to do |format|
      if @em_pcr.update_attributes(params[:em_pcr])
        format.html { redirect_to @em_pcr, notice: 'Em pcr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @em_pcr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /em_pcrs/1
  # DELETE /em_pcrs/1.json
  def destroy
    @em_pcr = EmPcr.find(params[:id])
    @em_pcr.destroy

    respond_to do |format|
      format.html { redirect_to em_pcrs_url }
      format.json { head :no_content }
    end
  end
end
