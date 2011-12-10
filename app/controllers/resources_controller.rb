class ResourcesController < ApplicationController

  # GET /resources.json
  # akcja sprwadza czy serwer stoi
  # mo¿na ja pozniej rozbudowac by zwracala tez inne 
  # kody z zaleznosci od stanu serwera
  # umowmy sie prosze ze uzywamy standardowych kodow serwerowych
  
  # Resource.find(:all)
  # ACHTUNG! (jeszcze) nie dziala 
  # - jest problem z dekodowaniem MultiJson'a po stronie klienta
  def index
	puts "index"
    @resources = nil

    respond_to do |format|
      format.json { render json: @resources }
    end
  end

  # GET /resources/1.json
  # metoda zwraca pewna ilosc obiektow Resource
  # w odpowiedzi na wartosc liczbowa
  # móg³by to byæ np. id uzytkownika i zwracano by nowe wpisy
  # teoretycznie mo¿na te¿ wys³aæ tu wiêcej paramsów np. id usera I id uslugi ,ale
  # bedzie trzeba zmienic œciezke(Routes) lub metodê (POST anyone?) i nie bedzie 
  # mozna tak wygodnie korzystac z dynamicznych metod 
  
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
    end
  end

  # GET /resources/1/edit
  # TODO: na razie nie ma zastosowania
  def edit
	puts "edit"
    @resource = Resource.find(params[:id])
  end


  # POST /resources.json
  # dodaj usera o podanym id do listy uslugi od podanym id
  
  # res.save
  def create
	puts "create"
	# TODO: spiac to razem
	# params[:resource]
	# params[:resource]
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
  # edytuje filrty podanego w paramsach usera dla podanej uslugi(tez w paramasach)
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
  # wypisz usera z uslugi
  
  # Resource.delete(1) lub
  # Resource.find(1).destroy
  def destroy
	puts "destroy"
	# TODO: wypisz usera
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.json { head :ok }
    end
  end
end
