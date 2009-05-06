class CardSortsController < ApplicationController

  before_filter :authenticate, :except => [:show]

  # GET /card_sorts
  # GET /card_sorts.xml
  def index
    @card_sorts = CardSort.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @card_sorts }
    end
  end

  # GET /card_sorts/1
  # GET /card_sorts/1.xml
  def show
    @card_sort = CardSort.find(params[:id])
    @reply = Reply.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card_sort }
    end
  end

  # GET /card_sorts/new
  # GET /card_sorts/new.xml
  def new
    @card_sort = CardSort.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card_sort }
    end
  end

  # GET /card_sorts/1/edit
  def edit
    @card_sort = CardSort.find(params[:id])
  end

  # POST /card_sorts
  # POST /card_sorts.xml
  def create
    @card_sort = CardSort.new(params[:card_sort])
    respond_to do |format|
      if @card_sort.save
        flash[:notice] = 'CardSort was successfully created.'
        format.html { redirect_to card_sorts_path }
        format.xml  { render :xml => @card_sort, :status => :created, :location => @card_sort }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card_sort.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /card_sorts/1
  # PUT /card_sorts/1.xml
  def update
    @card_sort = CardSort.find(params[:id])

    respond_to do |format|
      if @card_sort.update_attributes(params[:card_sort])
        flash[:notice] = 'CardSort was successfully updated.'
        format.html { redirect_to(@card_sort) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card_sort.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /card_sorts/1
  # DELETE /card_sorts/1.xml
  def destroy
    @card_sort = CardSort.find(params[:id])
    @card_sort.destroy

    respond_to do |format|
      format.html { redirect_to(card_sorts_url) }
      format.xml  { head :ok }
    end
  end
end
