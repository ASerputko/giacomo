class PersonesController < ApplicationController
  # GET /persones
  # GET /persones.json
  def index
    @persones = Persone.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @persones }
    end
  end

  # GET /persones/1
  # GET /persones/1.json
  def show
    @persone = Persone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @persone }
    end
  end

  # GET /persones/new
  # GET /persones/new.json
  def new
    @persone = Persone.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @persone }
    end
  end

  # GET /persones/1/edit
  def edit
    @persone = Persone.find(params[:id])
  end

  # POST /persones
  # POST /persones.json
  def create
    @persone = Persone.new(params[:persone])

    respond_to do |format|
      if @persone.save
        format.html { redirect_to @persone, notice: 'Persone was successfully created.' }
        format.json { render json: @persone, status: :created, location: @persone }
      else
        format.html { render action: "new" }
        format.json { render json: @persone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /persones/1
  # PUT /persones/1.json
  def update
    @persone = Persone.find(params[:id])

    respond_to do |format|
      if @persone.update_attributes(params[:persone])
        format.html { redirect_to @persone, notice: 'Persone was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @persone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /persones/1
  # DELETE /persones/1.json
  def destroy
    @persone = Persone.find(params[:id])
    @persone.destroy

    respond_to do |format|
      format.html { redirect_to persones_url }
      format.json { head :no_content }
    end
  end
end
