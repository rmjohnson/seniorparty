class QuotesController < ApplicationController

  # Before filter and the little private thing in the bottom are for authentication.
  # couldn't get a list action working by itself, but when I changed the name of it to 'new' it worked...
  # ...so i just hijacked :new and made it instead a kind of list function... should fix that.

  before_filter :authentication, :except => [:create, :index]

  # GET /quotes
  # GET /quotes.xml
  def index
    @quote = Quote.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  # GET /quotes/1
  # GET /quotes/1.xml
  def show
    @quote = Quote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quote }
    end
  end

  def list
    @quotes = Quote.all

    respond_to do |format|
      format.html # list.html.erb
      format.xml { render :xml => @quotes }
    end
  end


  # GET /quotes/1/edit
  def edit
    @quote = Quote.find(params[:id])
  end

  # POST /quotes
  # POST /quotes.xml
  def create
    @quote = Quote.new(params[:quote])

    respond_to do |format|
      if @quote.save
        flash[:notice] = 'Quote was successfully created.'
        format.html { redirect_to('/') }
        format.xml  { render :xml => @quote, :status => :created, :location => @quote }
      else
        format.html { render :action => 'index' }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quotes/1
  # PUT /quotes/1.xml
  def update
    @quote = Quote.find(params[:id])

    respond_to do |format|
      if @quote.update_attributes(params[:quote])
        flash[:notice] = 'Quote was successfully updated.'
        format.html { redirect_to(@quote) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.xml
  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy

    respond_to do |format|
      format.html { redirect_to(quotes_url) }
      format.xml  { head :ok }
    end
  end

  private

  def authentication
    id = "admin"
    pass = "admin"
    authenticate_or_request_with_http_basic do |user,password|
      user == id && password == pass
    end
  end
end
