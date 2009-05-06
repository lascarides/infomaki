class WireframesController < ApplicationController

  before_filter :authenticate
  before_filter :authenticate_admin, :only => [:edit, :new, :update, :create]

  # GET /wireframes
  # GET /wireframes.xml
  def index
    @wireframes = Wireframe.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wireframes }
    end
  end

  # GET /wireframes/1
  # GET /wireframes/1.xml
  def show
    @wireframe = Wireframe.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wireframe }
    end
  end

  # GET /wireframes/new
  # GET /wireframes/new.xml
  def new
    @wireframe = Wireframe.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wireframe }
    end
  end

  # GET /wireframes/1/edit
  def edit
    @wireframe = Wireframe.find(params[:id])
  end

  # POST /wireframes
  # POST /wireframes.xml
  def create
    @wireframe = Wireframe.new(params[:wireframe])

    respond_to do |format|
      if @wireframe.save
        flash[:notice] = 'Wireframe was successfully created.'
        format.html { redirect_to wireframes_path }
        format.xml  { render :xml => @wireframe, :status => :created, :location => @wireframe }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wireframe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wireframes/1
  # PUT /wireframes/1.xml
  def update
    @wireframe = Wireframe.find(params[:id])

    respond_to do |format|
      if @wireframe.update_attributes(params[:wireframe])
        flash[:notice] = 'Wireframe was successfully updated.'
        format.html { redirect_to wireframes_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wireframe.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wireframes/1
  # DELETE /wireframes/1.xml
  def destroy
    @wireframe = Wireframe.find(params[:id])
    if (@wireframe.is_active? or @wireframe.initiatives.map{|i| i.is_active?}.include?(true) )
      respond_to do |format|
        flash[:notice] = "Cannot delete an active screenshot. Please make sure it is inactive and not connected to any active tests."
        format.html { redirect_to( wireframes_path ) }
        format.xml  { head :ok }
      end
    else
      @wireframe.destroy
      respond_to do |format|
        format.html { redirect_to(wireframes_url) }
        format.xml  { head :ok }
      end
    end
  end
end
