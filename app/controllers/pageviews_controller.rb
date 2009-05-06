class PageviewsController < ApplicationController

  before_filter :authenticate, :except => [:show]
  before_filter :authenticate_admin, :only => [:edit, :new, :update, :create]

  # GET /pageviews
  # GET /pageviews.xml
  def index
    @pageviews = Pageview.paginate :page => params[:page], :order => 'created_at DESC'
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pageviews }
    end
  end

  # GET /pageviews/1
  # GET /pageviews/1.xml
  def show
    @pageview = Pageview.find(params[:id])
    @reply = Reply.new

    # Group all responses with the same question
    if is_logged_in?
      @pageviews = Pageview.find(:all, :conditions => ["name = ?", @pageview.name], :order => "created_at DESC")
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pageview }
    end
  end

  # GET /pageviews/new
  # GET /pageviews/new.xml
  def new
    @pageview = Pageview.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pageview }
    end
  end

  # GET /pageviews/1/edit
  def edit
    @pageview = Pageview.find(params[:id])
  end

  # POST /pageviews
  # POST /pageviews.xml
  def create
    @pageview = Pageview.new(params[:pageview])

    respond_to do |format|
      if @pageview.save
        flash[:notice] = 'Pageview was successfully created.'
        format.html { redirect_to(@pageview) }
        format.xml  { render :xml => @pageview, :status => :created, :location => @pageview }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pageview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pageviews/1
  # PUT /pageviews/1.xml
  def update
    @pageview = Pageview.find(params[:id])

    respond_to do |format|
      if @pageview.update_attributes(params[:pageview])
        flash[:notice] = 'Pageview was successfully updated.'
        format.html { redirect_to(@pageview) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pageview.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pageviews/1
  # DELETE /pageviews/1.xml
  def destroy
    @pageview = Pageview.find(params[:id])
    @pageview.destroy

    respond_to do |format|
      format.html { redirect_to(pageviews_url) }
      format.xml  { head :ok }
    end
  end
end
