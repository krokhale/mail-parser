class MastersController < ApplicationController
  # GET /masters
  # GET /masters.xml
  def index
    @masters = Master.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @masters }
    end
  end

  # GET /masters/1
  # GET /masters/1.xml
  def show
    @master = Master.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @master }
    end
  end

  # GET /masters/new
  # GET /masters/new.xml
  def new
    @master = Master.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @master }
    end
  end

  # GET /masters/1/edit
  def edit
    @master = Master.find(params[:id])
  end

  # POST /masters
  # POST /masters.xml
  def create
    @master = Master.new(params[:master])

    respond_to do |format|
      if @master.save
        categories = Category.find_all_by_master_id(@master.id)
        if categories.empty?
          Category.create(:name => "Secondary", :master_id => @master.id)
          Category.create(:name => "Tertiary", :master_id => @master.id)
        end
          
        flash[:notice] = 'Master was successfully created.'
        format.html { redirect_to(@master) }
        format.xml  { render :xml => @master, :status => :created, :location => @master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /masters/1
  # PUT /masters/1.xml
  def update
    @master = Master.find(params[:id])

    respond_to do |format|
      if @master.update_attributes(params[:master])
        flash[:notice] = 'Master was successfully updated.'
        format.html { redirect_to(@master) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /masters/1
  # DELETE /masters/1.xml
  def destroy
    @master = Master.find(params[:id])
    @master.destroy

    respond_to do |format|
      format.html { redirect_to :back}
      format.xml  { head :ok }
    end
  end
end
