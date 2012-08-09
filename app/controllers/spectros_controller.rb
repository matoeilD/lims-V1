class SpectrosController < ApplicationController
   #helper from devise
  before_filter :authenticate_user!
  
  
  
  
  # GET /spectros
  # GET /spectros.json
  def index
    @spectros = Spectro.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spectros }
    end
  end

  # GET /spectros/1
  # GET /spectros/1.json
  def show
    @spectro = Spectro.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @spectro }
    end
  end

  # GET /spectros/new
  # GET /spectros/new.json
  def new
    @spectro = Spectro.new
    
       #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds spectro _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @spectro }
    end
  end

  # GET /spectros/1/edit
  def edit
    @spectro = Spectro.find(params[:id])
  end

  # POST /spectros
  # POST /spectros.json
  def create
    @spectro = Spectro.new(params[:spectro])
    
   @elt=flash[:elt]
    @element = Element.new(@elt)
     @element.element_name=@spectro.spectro_name
      #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => 'start again, this name has already been taken'
        return
    end
    @element.save    
    #@spectro.spectro_name=flash[:elt][:element_name] 
    #permet d'associer elt a spectro pour projet::detail elt
    @spectro.element_id= Element.last.id

    respond_to do |format|
      if @spectro.save
        format.html { redirect_to @spectro, notice: 'Spectro was successfully created.' }
        format.json { render json: @spectro, status: :created, location: @spectro }
      else
        format.html { render action: "new" }
        format.json { render json: @spectro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /spectros/1
  # PUT /spectros/1.json
  def update
    @spectro = Spectro.find(params[:id])

    respond_to do |format|
      if @spectro.update_attributes(params[:spectro])
        format.html { redirect_to @spectro, notice: 'Spectro was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @spectro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spectros/1
  # DELETE /spectros/1.json
  def destroy
    @spectro = Spectro.find(params[:id])
    @spectro.destroy

    respond_to do |format|
      format.html { redirect_to spectros_url }
      format.json { head :no_content }
    end
  end
end
