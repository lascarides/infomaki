class InitiativesController < ApplicationController
  
  before_filter :authenticate, :except => [:random]
  before_filter :authenticate_admin, :only => [:edit, :new, :update, :create]

  # GET /initiatives
  # GET /initiatives.xml
  def index
    @initiatives = {
      "Card Sorts"  => CardSort.find(:all),
      "Pageviews"   => Pageview.find(:all),
      "Quizzes"     => Quiz.find(:all)
    }
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @initiatives }
    end
  end

  # GET /initiatives/1
  # GET /initiatives/1.xml
  def show
    @initiative = Initiative.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @initiative }
    end
  end

  # GET /initiatives/new
  # GET /initiatives/new.xml
  def new
  end

  # GET /initiatives/1/edit
  def edit
    @initiative = Initiative.find(params[:id])
  end

  # POST /initiatives
  # POST /initiatives.xml
  def create
    redirect_to new_initiative_path    
    # @initiative = params[:initiative][:type].constantize.new(params[:initiative])
    # respond_to do |format|
    #   if @initiative.save
    #     flash[:notice] = 'Initiative was successfully created.'
    #     format.html { redirect_to(@initiative) }
    #     format.xml  { render :xml => @initiative, :status => :created, :location => @initiative }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @initiative.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # PUT /initiatives/1
  # PUT /initiatives/1.xml
  def update
    @initiative = Initiative.find(params[:id])
    respond_to do |format|
      if @initiative.update_attributes(params[:initiative])
        flash[:notice] = 'Initiative was successfully updated.'
        format.html { redirect_to(@initiative) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @initiative.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /initiatives/1
  # DELETE /initiatives/1.xml
  def destroy
    @initiative = Initiative.find(params[:id])
    @initiative.destroy
    respond_to do |format|
      format.html { redirect_to(initiatives_url) }
      format.xml  { head :ok }
    end
  end

  # Get a random initiative for participation
  def random
    previously_viewed = Reply.find(:all, :conditions => ["session_id = ?", session.session_id]).map{ |r| r.initiative_id }
    previously_viewed = [0] if previously_viewed.size == 0
    counter = Initiative.count( :all, 
        :conditions => ["is_active = ? AND id NOT IN (?)", true, previously_viewed]
    )
    initiative = Initiative.find( :first, 
        :conditions => ["is_active = ? AND id NOT IN (?)", true, previously_viewed],
        :offset => rand( counter )
    )
    if initiative.nil?
      flash[:no_more_questions] = true
      redirect_to root_path
    else
      redirect_to initiative
    end
  end
  
  def activate
    @initiative = Initiative.find(params[:id])
    @initiative.is_active = true
    @initiative.save!
    respond_to do |format|
      format.js
    end
  end

  def inactivate
    @initiative = Initiative.find(params[:id])
    @initiative.is_active = false
    @initiative.save!
    respond_to do |format|
      format.js
    end
  end

end
