class WordsController < ApplicationController
  # GET /words
  # GET /words.xml
  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @words = @category.words
    else
    @words = Word.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @words }
    end
  end

  # GET /words/1
  # GET /words/1.xml
  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @word }
    end
  end
  

  # GET /words/new
  # GET /words/new.xml
  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  # POST /words
  # POST /words.xml
  def create
    @word = Word.new(params[:word])

    respond_to do |format|
      if @word.save
        flash[:notice] = 'Word was successfully created.'
        format.html { redirect_to(@word) }
        format.xml  { render :xml => @word, :status => :created, :location => @word }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def add_words
    Word.create(:str => params[:str], :category_id => params[:category_id])
     respond_to do |format|
     format.html{ render :update do |page|
         page.replace_html "updated", :partial => "add_word"
         page.visual_effect :highlight, 'updated' 
     	end
          }
      end
   end
  
  

  # PUT /words/1
  # PUT /words/1.xml
  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        flash[:notice] = 'Word was successfully updated.'
        format.html { redirect_to(@word) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @word.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /words/1
  # DELETE /words/1.xml
  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.xml  { head :ok }
    end
  end
end
