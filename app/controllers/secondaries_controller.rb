class SecondariesController < ApplicationController
  before_action :set_secondary, only: [:show, :edit, :update, :destroy]

  # GET /secondaries
  # GET /secondaries.json
  def index
    @secondaries = Secondary.all
  end

  # GET /secondaries/1
  # GET /secondaries/1.json
  def show
  end

  # GET /secondaries/new
  def new
    @secondary = Secondary.new
  end

  # GET /secondaries/1/edit
  def edit
  end

  # POST /secondaries
  # POST /secondaries.json
  def create
    @secondary = Secondary.new(secondary_params)

    respond_to do |format|
      if @secondary.save
        format.html { redirect_to @secondary, notice: 'Secondary was successfully created.' }
        format.json { render action: 'show', status: :created, location: @secondary }
      else
        format.html { render action: 'new' }
        format.json { render json: @secondary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secondaries/1
  # PATCH/PUT /secondaries/1.json
  def update
    respond_to do |format|
      if @secondary.update(secondary_params)
        format.html { redirect_to @secondary, notice: 'Secondary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @secondary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secondaries/1
  # DELETE /secondaries/1.json
  def destroy
    @secondary.destroy
    respond_to do |format|
      format.html { redirect_to secondaries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secondary
      @secondary = Secondary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secondary_params
      params[:secondary]
    end
end
