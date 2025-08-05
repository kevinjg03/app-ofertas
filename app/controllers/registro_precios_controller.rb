class RegistroPreciosController < ApplicationController
  before_action :set_registro_precio, only: %i[ show edit update destroy ]

  # GET /registro_precios or /registro_precios.json
  def index
    @registro_precios = RegistroPrecio.all
  end

  # GET /registro_precios/1 or /registro_precios/1.json
  def show
  end

  # GET /registro_precios/new
  def new
    @registro_precio = RegistroPrecio.new
  end

  # GET /registro_precios/1/edit
  def edit
  end

  # POST /registro_precios or /registro_precios.json
  def create
    @registro_precio = RegistroPrecio.new(registro_precio_params)

    respond_to do |format|
      if @registro_precio.save
        format.html { redirect_to @registro_precio, notice: "Registro precio was successfully created." }
        format.json { render :show, status: :created, location: @registro_precio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registro_precio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registro_precios/1 or /registro_precios/1.json
  def update
    respond_to do |format|
      if @registro_precio.update(registro_precio_params)
        format.html { redirect_to @registro_precio, notice: "Registro precio was successfully updated." }
        format.json { render :show, status: :ok, location: @registro_precio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registro_precio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registro_precios/1 or /registro_precios/1.json
  def destroy
    @registro_precio.destroy!

    respond_to do |format|
      format.html { redirect_to registro_precios_path, status: :see_other, notice: "Registro precio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro_precio
      @registro_precio = RegistroPrecio.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def registro_precio_params
      params.expect(registro_precio: [ :precio, :moneda, :fecha_registro, :foto_ticket_url, :latitud, :longitud, :es_atipico, :estado_registro_id, :producto_id, :comercio_id, :usuario_id ])
    end
end
