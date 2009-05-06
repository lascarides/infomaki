class RepliesController < ApplicationController

  before_filter :authenticate, :except => [:new, :create]

  # GET /replies
  # GET /replies.xml
  def index
    @replies = Reply.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @replies }
    end
  end

  # GET /replies/1
  # GET /replies/1.xml
  def show
    @reply = Reply.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @reply }
    end
  end

  # GET /replies/new
  # GET /replies/new.xml
  def new
    @reply = Reply.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @reply }
    end
  end

  # GET /replies/1/edit
  def edit
    @reply = Reply.find(params[:id])
  end

  # POST /replies
  # POST /replies.xml
  def create
    @reply = Reply.new(params[:reply])
    @reply.session_id  = session.session_id
    @reply.remote_ip   = request.remote_ip
    @reply.short_answer = params[:other_field] if @reply.short_answer == "Other"
    @reply.coordinate_x = params[:x]
    @reply.coordinate_y = params[:y]
    respond_to do |format|
      if @reply.save
        if session[:keep_going]
          format.html { redirect_to("/participate") }
        else
          format.html { redirect_to(:controller => 'about', :action => 'thanks') }
        end
      else
        format.html { redirect_to Initiative.find(params[:reply][:initiative_id]) }
      end
    end
  end

  # PUT /replies/1
  # PUT /replies/1.xml
  def update
    @reply = Reply.find(params[:id])

    respond_to do |format|
      if @reply.update_attributes(params[:reply])
        flash[:notice] = 'Reply was successfully updated.'
        format.html { redirect_to(@reply) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @reply.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /replies/1
  # DELETE /replies/1.xml
  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy

    respond_to do |format|
      format.html { redirect_to(replies_url) }
      format.xml  { head :ok }
    end
  end
end
