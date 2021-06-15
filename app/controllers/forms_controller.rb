class FormsController < ApplicationController
  before_action :set_form, only: %i[ show edit update destroy thanks ]

  # GET /forms or /forms.json
  def index
    @forms = Form.all
  end

  # GET /forms/1 or /forms/1.json
  def show
    @json = JSON.parse(@form.payload, object_class: OpenStruct)
  end

  def thanks
  end
  

  # GET /forms/new
  def new
    @form = Form.new
  end

  # GET /forms/1/edit
  def edit
    @json = JSON.parse(@form.payload, object_class: OpenStruct)
  end

  # POST /forms or /forms.json
  def create
    @form = Form.new(form_params)

    uri = URI('https://google-form-exporter.herokuapp.com/formdress')
    params = { url: @form.url }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    @form.payload = res.body.force_encoding('UTF-8') if res.is_a?(Net::HTTPSuccess)
    @form.uuid = SecureRandom.hex(5)
    respond_to do |format|
      while !@form.save
        @form.uuid = SecureRandom.hex(5)
      end
      if @form.save
        format.html { redirect_to edit_form_path(@form), notice: "Form was successfully created." }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forms/1 or /forms/1.json
  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: "Form was successfully updated." }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1 or /forms/1.json
  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: "Form was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form
      @form = Form.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def form_params
      params.require(:form).permit(:url, :html, :creator, :thanks, :font)
    end
end
