class PreferenciaController < ApplicationController
  before_action :set_preferencium, only: %i[ show edit update destroy ]

  # GET /preferencia or /preferencia.json
  def index
    @preferencia = Preferencium.all
  end

  # GET /preferencia/1 or /preferencia/1.json
  def show
  end

  # GET /preferencia/new
  def new
    @preferencium = Preferencium.new
  end

  # GET /preferencia/1/edit
  def edit
  end

  # POST /preferencia or /preferencia.json
  def create
    @preferencium = Preferencium.new(preferencium_params)

    respond_to do |format|
      if @preferencium.save
        format.html { redirect_to @preferencium, notice: "Preferencium was successfully created." }
        format.json { render :show, status: :created, location: @preferencium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferencia/1 or /preferencia/1.json
  def update
    respond_to do |format|
      if @preferencium.update(preferencium_params)
        format.html { redirect_to @preferencium, notice: "Preferencium was successfully updated." }
        format.json { render :show, status: :ok, location: @preferencium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preferencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferencia/1 or /preferencia/1.json
  def destroy
    @preferencium.destroy!

    respond_to do |format|
      format.html { redirect_to preferencia_path, status: :see_other, notice: "Preferencium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preferencium
      @preferencium = Preferencium.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def preferencium_params
      params.expect(preferencium: [ :unidad_monetaria, :recibir_notificaciones, :usuario_id ])
    end
end
