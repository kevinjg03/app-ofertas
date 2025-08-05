class ListaComprasController < ApplicationController
  before_action :set_lista_compra, only: %i[ show edit update destroy ]

  # GET /lista_compras or /lista_compras.json
  def index
    @lista_compras = ListaCompra.all
  end

  # GET /lista_compras/1 or /lista_compras/1.json
  def show
  end

  # GET /lista_compras/new
  def new
    @lista_compra = ListaCompra.new
  end

  # GET /lista_compras/1/edit
  def edit
  end

  # POST /lista_compras or /lista_compras.json
  def create
    @lista_compra = ListaCompra.new(lista_compra_params)

    respond_to do |format|
      if @lista_compra.save
        format.html { redirect_to @lista_compra, notice: "Lista compra was successfully created." }
        format.json { render :show, status: :created, location: @lista_compra }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lista_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lista_compras/1 or /lista_compras/1.json
  def update
    respond_to do |format|
      if @lista_compra.update(lista_compra_params)
        format.html { redirect_to @lista_compra, notice: "Lista compra was successfully updated." }
        format.json { render :show, status: :ok, location: @lista_compra }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lista_compra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lista_compras/1 or /lista_compras/1.json
  def destroy
    @lista_compra.destroy!

    respond_to do |format|
      format.html { redirect_to lista_compras_path, status: :see_other, notice: "Lista compra was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lista_compra
      @lista_compra = ListaCompra.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lista_compra_params
      params.expect(lista_compra: [ :nombre, :fecha_creacion, :usuario_id ])
    end
end
