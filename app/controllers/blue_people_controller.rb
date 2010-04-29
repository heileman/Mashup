class BluePeopleController < ApplicationController
  # GET /blue_people
  # GET /blue_people.xml
  def index
    @blue_people = BluePerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @blue_people }
    end
  end

  # GET /blue_people/1
  # GET /blue_people/1.xml
  def show
    @blue_person = BluePerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @blue_person }
    end
  end

  # GET /blue_people/new
  # GET /blue_people/new.xml
  def new
    @blue_person = BluePerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @blue_person }
    end
  end

  # GET /blue_people/1/edit
  def edit
    @blue_person = BluePerson.find(params[:id])
  end

  # POST /blue_people
  # POST /blue_people.xml
  def create
    @blue_person = BluePerson.new(params[:blue_person])

    respond_to do |format|
      if @blue_person.save
        flash[:notice] = 'BluePerson was successfully created.'
        format.html { redirect_to(@blue_person) }
        format.xml  { render :xml => @blue_person, :status => :created, :location => @blue_person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @blue_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /blue_people/1
  # PUT /blue_people/1.xml
  def update
    @blue_person = BluePerson.find(params[:id])

    respond_to do |format|
      if @blue_person.update_attributes(params[:blue_person])
        flash[:notice] = 'BluePerson was successfully updated.'
        format.html { redirect_to(@blue_person) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @blue_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /blue_people/1
  # DELETE /blue_people/1.xml
  def destroy
    @blue_person = BluePerson.find(params[:id])
    @blue_person.destroy

    respond_to do |format|
      format.html { redirect_to(blue_people_url) }
      format.xml  { head :ok }
    end
  end
end
