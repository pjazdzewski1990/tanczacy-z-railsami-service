class ResourcesController < ApplicationController

  # GET /resources.json
  # zwraca kolekcje postów
  
  # Resource.find(:all)
  # ACHTUNG! (jeszcze) nie dziala 
  # - jest problem z dekodowaniem MultiJson'a po stronie klienta
  def index
	puts "index"
    @resources = Resource.all

    respond_to do |format|
      format.json { render json: @resources }
	  format.html { render html: @resources }
    end
  end

  # GET /resources/1.json
  # metoda zwraca konkretny post
  
  # Resource.find(1)
  def show
	puts "show"
	# TODO: powinno zebraæ wpisy
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.json { render json: @resource }
    end
  end

  # GET /resources/new.json
  # TODO: na razie nie ma zastosowania
  
  def new
	puts "new"
    @resource = Resource.new

    respond_to do |format|
      format.json { render json: @resource }
	  format.html { render html: @resources }
    end
  end

  # GET /resources/1/edit
  # TODO: na razie nie ma zastosowania
  def edit
	puts "edit"
    @resource = Resource.find(params[:id])
  end


  # POST /resources.json
  # TODO: na razie nie ma zastosowania
  
  # res.save
  def create
	puts "create"
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1.json
  # TODO: na razie nie ma zastosowania
  def update
	puts "update"
    #TODO: narazie koncepcja filtru jest czysta abstrakcja 
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.json { head :ok }
      else
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1.json
  # niszcz post
  
  # Resource.delete(1) lub
  # Resource.find(1).destroy
  def destroy
	puts "destroy"
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
