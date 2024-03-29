class CokhungthoigiansController < ApplicationController
  # GET /cokhungthoigians
  # GET /cokhungthoigians.json
  def index
    @cokhungthoigians = Cokhungthoigian.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cokhungthoigians }
    end
  end

  # GET /cokhungthoigians/1
  # GET /cokhungthoigians/1.json
  def show
    @cokhungthoigian = Cokhungthoigian.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cokhungthoigian }
    end
  end

  # GET /cokhungthoigians/new
  # GET /cokhungthoigians/new.json
  def new
    @cokhungthoigian = Cokhungthoigian.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cokhungthoigian }
    end
  end

  # GET /cokhungthoigians/1/edit
  def edit
    @cokhungthoigian = Cokhungthoigian.find(params[:id])
  end

  # POST /cokhungthoigians
  # POST /cokhungthoigians.json
  def create
    @cokhungthoigian = Cokhungthoigian.new(params[:cokhungthoigian])

    respond_to do |format|
      if @cokhungthoigian.save
        format.html { redirect_to @cokhungthoigian, notice: 'Cokhungthoigian was successfully created.' }
        format.json { render json: @cokhungthoigian, status: :created, location: @cokhungthoigian }
      else
        format.html { render action: "new" }
        format.json { render json: @cokhungthoigian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cokhungthoigians/1
  # PUT /cokhungthoigians/1.json
  def update
    @cokhungthoigian = Cokhungthoigian.find(params[:id])

    respond_to do |format|
      if @cokhungthoigian.update_attributes(params[:cokhungthoigian])
        format.html { redirect_to @cokhungthoigian, notice: 'Cokhungthoigian was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cokhungthoigian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cokhungthoigians/1
  # DELETE /cokhungthoigians/1.json
  def destroy
    @cokhungthoigian = Cokhungthoigian.find(params[:id])
    @cokhungthoigian.destroy

    respond_to do |format|
      format.html { redirect_to cokhungthoigians_url }
      format.json { head :no_content }
    end
  end

  def cokhungtgs_android
    @cokhungtgs = Cokhungthoigian.find_all_by_biensoxe(params[:id])

    @khungtg = Array.new
    @cokhungtgs.each do |c|
      @tg = Khungthoigian.find_by_id(c.makhungtg)
      @chitiet = @tg.di.strftime("%H:%M:%S") + " - " + @tg.den.strftime("%H:%M:%S")
      @khungtg.append(@chitiet)
    end
    @result = {"success" => 1, "khungtgs" => @khungtg}
    render :json =>@result
  end
end
