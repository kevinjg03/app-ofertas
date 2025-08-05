class ListaDetallesController < ApplicationController
  before_action :set_lista_detalle, only: %i[ show edit update destroy ]

  # GET /lista_detalles or /lista_detalles.json
  def index
    @lista_detalles = ListaDetalle.all
  end

  # GET /lista_detalles/1 or /lista_detalles/1.json
  def show
  end

  # GET /lista_detalles/new
  def new
    @lista_detalle = ListaDetalle.new
  end

  # GET /lista_detalles/1/edit
  def edit
  end

  # POST /lista_detalles or /lista_detalles.json
  def create
    @lista_detalle = ListaDetalle.new(lista_detalle_params)

    respond_to do |format|
      if @lista_detalle.save
        format.html { redirect_to @lista_detalle, notice: "Lista detalle was successfully created." }
        format.json { render :show, status: :created, location: @lista_detalle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lista_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lista_detalles/1 or /lista_detalles/1.json
  def update
    respond_to do |format|
      if @lista_detalle.update(lista_detalle_params)
        format.html { redirect_to @lista_detalle, notice: "Lista detalle was successfully updated." }
        format.json { render :show, status: :ok, location: @lista_detalle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lista_detalle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista_detalles/1 or /lista_detalles/1.json
  def destroy
    @lista_detalle.destroy!

    respond_to do |format|
      format.html { redirect_to lista_detalles_path, status: :see_other, notice: "Lista detalle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lista_detalle
      @lista_detalle = ListaDetalle.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lista_detalle_params
      params.expect(lista_detalle: [ :cantidad, :prioridad, :lista_compra_id, :producto_id ])
    end
end
