class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
  end

  # GET /forms/new
  def new
    @form = Form.new
    @form.references.build
    @form.secondaries.build
  end

  # GET /forms/1/edit
  def edit
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @form }
      else
        format.html { render action: 'new' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1
  # PATCH/PUT /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_params

      format_date_for('date_of_birth')
      format_date_for('date_of_issue')
      format_date_for('valid_until')
      format_date_for('date_of_arrival')

      delete_unused_date_fields_for('date_of_birth')
      delete_unused_date_fields_for('date_of_issue')
      delete_unused_date_fields_for('valid_until')
      delete_unused_date_fields_for('date_of_arrival')

      params[:form].permit!
    end

    def format_date_for(field)
      params[:form][field] = Time.new(params[:form]["#{field}(1i)"], params[:form]["#{field}(2i)"], params[:form]["#{field}(3i)"])
    end

    def delete_unused_date_fields_for(field)
      params[:form].delete("#{field}(1i)")
      params[:form].delete("#{field}(2i)")
      params[:form].delete("#{field}(3i)")
    end

end
