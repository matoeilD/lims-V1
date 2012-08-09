class LibrariesController < ApplicationController
  
   #helper from devise
  before_filter :authenticate_user!
  
  
  
  # GET /libraries
  # GET /libraries.json
  def index
    @libraries = Library.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @libraries }
    end
  end

  # GET /libraries/1
  # GET /libraries/1.json
  def show
    @library = Library.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @library }
    end
  end

  # GET /libraries/new
  # GET /libraries/new.json
  def new
    @library = Library.new
    

   #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds extraction _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @library }
    end
  end

  # GET /libraries/1/edit
  def edit
    @library = Library.find(params[:id])
  end

  # POST /libraries
  # POST /libraries.json
  

  
  
  
  
  
  
  #sauve en parallele library and elt
  def create
    @library = Library.new(params[:library])
     @elt=flash[:elt]
    @element = Element.new(@elt)
    @element.element_name=@library.library_name
     #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => 'start again, this name has already been taken'
        return
    end
    @element.save    
    #@library.library_name=flash[:elt][:element_name] 
    #permet d'associer elt a em_pcr pour projet::detail elt
    @library.element_id= Element.last.id

    respond_to do |format|
      if @library.save
        format.html { redirect_to @library, notice: 'Library was successfully created.' }
        format.json { render json: @library, status: :created, location: @library }
      else
       
        format.html { render action: "new" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /libraries/1
  # PUT /libraries/1.json
  def update
    @library = Library.find(params[:id])

    respond_to do |format|
      if @library.update_attributes(params[:library])
        format.html { redirect_to @library, notice: 'Library was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1
  # DELETE /libraries/1.json
  def destroy
    @library = Library.find(params[:id])
    @library.destroy

    respond_to do |format|
      format.html { redirect_to libraries_url }
      format.json { head :no_content }
    end
  end
end
