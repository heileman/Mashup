class RedPeopleController < ApplicationController
  # GET /red_people
  # GET /red_people.xml
  def index
    @red_people = RedPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @red_people }
    end
  end

  # GET /red_people/1
  # GET /red_people/1.xml
  def show
    @red_person = RedPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @red_person }
    end
  end

  # GET /red_people/new
  # GET /red_people/new.xml
  def new
    @red_person = RedPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @red_person }
    end
  end

  # GET /red_people/1/edit
  def edit
    @red_person = RedPerson.find(params[:id])
  end

  # POST /red_people
  # POST /red_people.xml
  def create
    @red_person = RedPerson.new(params[:red_person])

    respond_to do |format|
      if @red_person.save
        flash[:notice] = 'RedPerson was successfully created.'
        format.html { redirect_to(@red_person) }
        format.xml  { render :xml => @red_person, :status => :created, :location => @red_person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @red_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /red_people/1
  # PUT /red_people/1.xml
  def update
    @red_person = RedPerson.find(params[:id])

    respond_to do |format|
      if @red_person.update_attributes(params[:red_person])
        flash[:notice] = 'RedPerson was successfully updated.'
        format.html { redirect_to(@red_person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @red_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /red_people/1
  # DELETE /red_people/1.xml
  def destroy
    @red_person = RedPerson.find(params[:id])
    @red_person.destroy

    respond_to do |format|
      format.html { redirect_to(red_people_url) }
      format.xml  { head :ok }
    end
  end
end
