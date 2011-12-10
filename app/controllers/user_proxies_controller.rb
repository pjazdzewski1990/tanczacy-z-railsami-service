class UserProxiesController < ApplicationController
  # GET /user_proxies
  # GET /user_proxies.json
  def index
    @user_proxies = UserProxy.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_proxies }
    end
  end

  # GET /user_proxies/1
  # GET /user_proxies/1.json
  def show
    @user_proxy = UserProxy.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_proxy }
    end
  end

  # GET /user_proxies/new
  # GET /user_proxies/new.json
  def new
    @user_proxy = UserProxy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_proxy }
    end
  end

  # GET /user_proxies/1/edit
  def edit
    @user_proxy = UserProxy.find(params[:id])
  end

  # POST /user_proxies
  # POST /user_proxies.json
  def create
    @user_proxy = UserProxy.new(params[:user_proxy])

    respond_to do |format|
      if @user_proxy.save
        format.html { redirect_to @user_proxy, notice: 'User proxy was successfully created.' }
        format.json { render json: @user_proxy, status: :created, location: @user_proxy }
      else
        format.html { render action: "new" }
        format.json { render json: @user_proxy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_proxies/1
  # PUT /user_proxies/1.json
  def update
    @user_proxy = UserProxy.find(params[:id])

    respond_to do |format|
      if @user_proxy.update_attributes(params[:user_proxy])
        format.html { redirect_to @user_proxy, notice: 'User proxy was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_proxy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_proxies/1
  # DELETE /user_proxies/1.json
  def destroy
    @user_proxy = UserProxy.find(params[:id])
    @user_proxy.destroy

    respond_to do |format|
      format.html { redirect_to user_proxies_url }
      format.json { head :ok }
    end
  end
end
