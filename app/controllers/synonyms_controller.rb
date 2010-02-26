class SynonymsController < ApplicationController
  # GET /synonyms
  # GET /synonyms.xml
  def index
    if params[:word_id]
      @word = Word.find(params[:word_id])
      @synonyms = @word.synonyms
    else
    @words = Word.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @synonyms }
    end
  end

  # GET /synonyms/1
  # GET /synonyms/1.xml
  def show
    @synonym = Synonym.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @synonym }
    end
  end
  
  def add_synonyms
    Synonym.create(:str => params[:str], :word_id => params[:word_id])
     respond_to do |format|
     format.html{ render :update do |page|
         page.replace_html "updated", :partial => "add_synonym"
         page.visual_effect :highlight, 'updated' 
     	end
          }
      end
   end

  # GET /synonyms/new
  # GET /synonyms/new.xml
  def new
    @synonym = Synonym.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @synonym }
    end
  end

  # GET /synonyms/1/edit
  def edit
    @synonym = Synonym.find(params[:id])
  end

  # POST /synonyms
  # POST /synonyms.xml
  def create
    @synonym = Synonym.new(params[:synonym])

    respond_to do |format|
      if @synonym.save
        flash[:notice] = 'Synonym was successfully created.'
        format.html { redirect_to(@synonym) }
        format.xml  { render :xml => @synonym, :status => :created, :location => @synonym }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @synonym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /synonyms/1
  # PUT /synonyms/1.xml
  def update
    @synonym = Synonym.find(params[:id])

    respond_to do |format|
      if @synonym.update_attributes(params[:synonym])
        flash[:notice] = 'Synonym was successfully updated.'
        format.html { redirect_to(@synonym) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @synonym.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /synonyms/1
  # DELETE /synonyms/1.xml
  def destroy
    @synonym = Synonym.find(params[:id])
    @synonym.destroy

    respond_to do |format|
      format.html { redirect_to :back}
      format.xml  { head :ok }
    end
  end
end
