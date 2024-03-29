class TramdungsController < ApplicationController
  # GET /tramdungs
  # GET /tramdungs.json
  def index
    @tramdungs = Tramdung.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tramdungs }
    end
  end

  def tramdungs_android
    @tramdungs = Tramdung.all

    result = {"success" => 1, "tramdungs" => @tramdungs}
    render :json => result

  end

  # GET /tramdungs/1
  # GET /tramdungs/1.json
  def show
    @tramdung = Tramdung.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tramdung }
    end
  end

  # GET /tramdungs/new
  # GET /tramdungs/new.json
  def new
    @tramdung = Tramdung.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tramdung }
    end
  end

  # GET /tramdungs/1/edit
  def edit
    @tramdung = Tramdung.find(params[:id])
  end

  # POST /tramdungs
  # POST /tramdungs.json
  def create
    @tramdung = Tramdung.new(params[:tramdung])

    respond_to do |format|
      if @tramdung.save
        format.html { redirect_to @tramdung, notice: 'Tramdung was successfully created.' }
        format.json { render json: @tramdung, status: :created, location: @tramdung }
      else
        format.html { render action: "new" }
        format.json { render json: @tramdung.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tramdungs/1
  # PUT /tramdungs/1.json
  def update
    @tramdung = Tramdung.find(params[:id])

    respond_to do |format|
      if @tramdung.update_attributes(params[:tramdung])
        format.html { redirect_to @tramdung, notice: 'Tramdung was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tramdung.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tramdungs/1
  # DELETE /tramdungs/1.json
  def destroy
    @tramdung = Tramdung.find(params[:id])
    @tramdung.destroy

    respond_to do |format|
      format.html { redirect_to tramdungs_url }
      format.json { head :no_content }
    end
  end
end
