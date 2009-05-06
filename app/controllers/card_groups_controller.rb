class CardGroupsController < ApplicationController

  before_filter :authenticate

  # GET /card_groups
  # GET /card_groups.xml
  def index
    @card_groups = CardGroup.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @card_groups }
    end
  end

  # GET /card_groups/1
  # GET /card_groups/1.xml
  def show
    @card_group = CardGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @card_group }
    end
  end

  # GET /card_groups/new
  # GET /card_groups/new.xml
  def new
    @card_group = CardGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @card_group }
    end
  end

  # GET /card_groups/1/edit
  def edit
    @card_group = CardGroup.find(params[:id])
  end

  # POST /card_groups
  # POST /card_groups.xml
  def create
    @card_group = CardGroup.new(params[:card_group])

    respond_to do |format|
      if @card_group.save
        flash[:notice] = 'CardGroup was successfully created.'
        format.html { redirect_to(@card_group) }
        format.xml  { render :xml => @card_group, :status => :created, :location => @card_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @card_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /card_groups/1
  # PUT /card_groups/1.xml
  def update
    @card_group = CardGroup.find(params[:id])

    respond_to do |format|
      if @card_group.update_attributes(params[:card_group])
        flash[:notice] = 'CardGroup was successfully updated.'
        format.html { redirect_to(@card_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @card_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /card_groups/1
  # DELETE /card_groups/1.xml
  def destroy
    @card_group = CardGroup.find(params[:id])
    @card_group.destroy

    respond_to do |format|
      format.html { redirect_to(card_groups_url) }
      format.xml  { head :ok }
    end
  end
end
