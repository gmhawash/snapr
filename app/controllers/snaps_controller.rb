class SnapsController < ApplicationController
  # GET /snaps
  # GET /snaps.xml
  def index
    @snaps = Snap.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snaps }
    end
  end

  # GET /snaps/1
  # GET /snaps/1.xml
  def show
    @snap = Snap.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @snap }
    end
  end

  # GET /snaps/new
  # GET /snaps/new.xml
  def new
    @snap = Snap.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snap }
    end
  end

  # GET /snaps/1/edit
  def edit
    @snap = Snap.find(params[:id])
  end

  # POST /snaps
  # POST /snaps.xml
  def create
    # Check some authenticity token, username, password (must be logged into a session)...
    @snap = Snap.new(params[:snap])

    render :inline => @snap.html
    #respond_to do |format|
      #if @snap.save
        #format.html { redirect_to(@snap, :notice => 'Snap was successfully created.') }
        #format.xml  { render :xml => @snap, :status => :created, :location => @snap }
      #else
        #format.html { render :action => "new" }
        #format.xml  { render :xml => @snap.errors, :status => :unprocessable_entity }
      #end
    #end
  end

  # PUT /snaps/1
  # PUT /snaps/1.xml
  def update
    @snap = Snap.find(params[:id])

    respond_to do |format|
      if @snap.update_attributes(params[:snap])
        format.html { redirect_to(@snap, :notice => 'Snap was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snap.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snaps/1
  # DELETE /snaps/1.xml
  def destroy
    @snap = Snap.find(params[:id])
    @snap.destroy

    respond_to do |format|
      format.html { redirect_to(snaps_url) }
      format.xml  { head :ok }
    end
  end
end
