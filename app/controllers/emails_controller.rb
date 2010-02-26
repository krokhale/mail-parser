class EmailsController < ApplicationController
  # GET /emails
  # GET /emails.xml
  def index
    @emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails }
    end
  end
  
  def get_mail
    require 'mail'
    require 'pop_ssl.rb'
    
    Mail.defaults do
       retriever_method :pop3, { :address             => "pop.gmail.com",
                                 :port                => 995,
                                 :user_name           => 'temp.nav.chat',
                                 :password            => 'tempnavchat',
                                 :enable_ssl          => true }
     end
     
     emails = Mail.all
     emails.each do |email|
       subject = email.subject
       body = email.parts[0].body.decoded
       file_name = email.parts[1].content_type_parameters[:name]
       file_content = email.parts[1].body.decoded
       category_id = get_category_id(body)
       path = File.join(RAILS_ROOT, 'attachments', file_name)
       file = File.open(path, "wb")  { |f| f.write(file_content) }
       if !category_id.empty?
         tags = category_id.join(",")
         new_mail = Email.create(:subject => subject, :body => body, :tags => tags)
       else
         new_mail = Email.create(:subject => subject, :body => body, :tags => "none found!")
       end
       Attachment.create(:name => file_name, :email_id => new_mail.id)
     end
     redirect_to :back
   end
   
   def get_category_id(body)
     words = []
     body_array = []
     category_id = []
     body.split(/[^-a-zA-Z]/).each do |word|
       body_array << word
     end
     body_array.flatten!
     categories = Category.find(:all)
     categories.each do |category|
       words << category.words.collect(&:str)
     end
     words.flatten!
     match_array = words & body_array
     match_array.flatten!
     
     if !match_array.empty?
       match_array.each do |word|
         category_id << Word.find_all_by_str(word.to_s).collect(&:category_id)
       end
       category_id.flatten!
       category_id.uniq!
     end   
     #if match_array.count == 0 || match_array.count > 1
      # category_id = nil
      # else 
      # category_id = Word.find_by_str(match_array.to_s).category.id
   #end
    return category_id  
   end
   

   
   def get_attachment
     file_name = Email.find(params[:id]).attachment.name
     path = File.join(RAILS_ROOT, 'attachments', file_name)
     send_file "#{path}"
   end
     
     

  # GET /emails/1
  # GET /emails/1.xml
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.xml
  def new
    @email = Email.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/1/edit
  def edit
    @email = Email.find(params[:id])
  end

  # POST /emails
  # POST /emails.xml
  def create
    @email = Email.new(params[:email])

    respond_to do |format|
      if @email.save
        flash[:notice] = 'Email was successfully created.'
        format.html { redirect_to(@email) }
        format.xml  { render :xml => @email, :status => :created, :location => @email }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emails/1
  # PUT /emails/1.xml
  def update
    @email = Email.find(params[:id])

    respond_to do |format|
      if @email.update_attributes(params[:email])
        flash[:notice] = 'Email was successfully updated.'
        format.html { redirect_to(@email) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.xml
  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to(emails_url) }
      format.xml  { head :ok }
    end
  end
end
