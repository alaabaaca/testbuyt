class DiemtrentuyensController < ApplicationController
  # GET /diemtrentuyens
  # GET /diemtrentuyens.json
  def index
    @diemtrentuyens = Diemtrentuyen.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diemtrentuyens }
    end
  end

  # GET /diemtrentuyens/1
  # GET /diemtrentuyens/1.json
  def show
    @diemtrentuyen = Diemtrentuyen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @diemtrentuyen }
    end
  end

  # GET /diemtrentuyens/new
  # GET /diemtrentuyens/new.json
  def new
    @diemtrentuyen = Diemtrentuyen.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @diemtrentuyen }
    end
  end

  # GET /diemtrentuyens/1/edit
  def edit
    @diemtrentuyen = Diemtrentuyen.find(params[:id])
  end

  # POST /diemtrentuyens
  # POST /diemtrentuyens.json
  def create
    @diemtrentuyen = Diemtrentuyen.new(params[:diemtrentuyen])

    respond_to do |format|
      if @diemtrentuyen.save
        format.html { redirect_to @diemtrentuyen, notice: 'Diemtrentuyen was successfully created.' }
        format.json { render json: @diemtrentuyen, status: :created, location: @diemtrentuyen }
      else
        format.html { render action: "new" }
        format.json { render json: @diemtrentuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diemtrentuyens/1
  # PUT /diemtrentuyens/1.json
  def update
    @diemtrentuyen = Diemtrentuyen.find(params[:id])

    respond_to do |format|
      if @diemtrentuyen.update_attributes(params[:diemtrentuyen])
        format.html { redirect_to @diemtrentuyen, notice: 'Diemtrentuyen was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @diemtrentuyen.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diemtrentuyens/1
  # DELETE /diemtrentuyens/1.json
  def destroy
    @diemtrentuyen = Diemtrentuyen.find(params[:id])
    @diemtrentuyen.destroy

    respond_to do |format|
      format.html { redirect_to diemtrentuyens_url }
      format.json { head :no_content }
    end
  end

  def diemtrentuyens_android
    #@diemtrentuyens  =  Diemtrentuyen.find_all_by_matuyen(params[:id])
    #@diemtrentuyens = Diemtrentuyen.find(:all, :order =>  sort_by('id'))
    @diemtrentuyens  =  Diemtrentuyen.find_all_by_matuyen(params[:id]).sort()
   # @diemtrentuyens.sort_by("id")
    @result = {"success" => 1, "diemtrentuyens" => @diemtrentuyens}
    render :json => @result
  end
end
