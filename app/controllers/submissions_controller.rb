class SubmissionsController < ApplicationController
   #helper from devise
  before_filter :authenticate_user!
  
      #cancan permet d'afficher uniqeuement si authoriser dans ability.rb
 load_and_authorize_resource
  
  
  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @submissions }
    end
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
    @submission = Submission.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/new
  # GET /submissions/new.json
  def new
    @submission = Submission.new
     
   #params :elt from elementcontroller
     @project_associe_id=params[:elt][:cp]  # va servir ds extraction _form view
      @e=params[:elt] 
      @e.delete(:cp)      
    flash[:elt]=@e  #from elementcontroller used for next action :create

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @submission }
    end
  end

  # GET /submissions/1/edit
  def edit
    @submission = Submission.find(params[:id])
  end

  # POST /submissions
  # POST /submissions.json
  
   #renseigne l'id de l element associé...si submission n est pas sauvé, l'element nouvellement cree est effacé
  
  def create
    @submission = Submission.new(params[:submission])
    
     @elt=flash[:elt]
    @element = Element.new(@elt)
      @element.element_name=@submission.submission_name
       
    #cf uniqueness of element_name ds model
    if  ! (@element.valid?)
      if (@element.projects.blank?)
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved! make sure all required fields (*) has been filled '
        return
      else
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved! name already used '
        return
        end
    end
    
       #cf presence of _assoc ds model
    if  ! (@submission.valid?)
        redirect_to :controller => 'elements', :action => 'new', :notice => ' element has not been saved! make sure all required fields (*) has been filled '
        return
    end
    
    @element.save    
     #@submission.submission_name=flash[:elt][:element_name] 
       #permet d'associer elt a sub pour projet::detail elt
    @submission.element_id= Element.last.id

    respond_to do |format|
      if @submission.save
        format.html { redirect_to @submission, notice: 'Submission was successfully created.' }
        format.json { render json: @submission, status: :created, location: @submission }
      else
       
        format.html { render action: "new" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /submissions/1
  # PUT /submissions/1.json
  def update
    @submission = Submission.find(params[:id])

    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to @submission, notice: 'Submission was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy

    respond_to do |format|
      format.html { redirect_to submissions_url }
      format.json { head :no_content }
    end
  end
end
