class ModeradorsController < ApplicationController
  before_action :set_moderador, only: %i[ show edit update destroy ]

  # GET /moderadors or /moderadors.json
  def index
    @moderadors = Moderador.all
  end

  # GET /moderadors/1 or /moderadors/1.json
  def show
  end

  # GET /moderadors/new
  def new
    @moderador = Moderador.new
  end

  # GET /moderadors/1/edit
  def edit
  end

  # POST /moderadors or /moderadors.json
  def create
    @moderador = Moderador.new(moderador_params)

    respond_to do |format|
      if @moderador.save
        format.html { redirect_to @moderador, notice: "Moderador was successfully created." }
        format.json { render :show, status: :created, location: @moderador }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moderador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moderadors/1 or /moderadors/1.json
  def update
    respond_to do |format|
      if @moderador.update(moderador_params)
        format.html { redirect_to @moderador, notice: "Moderador was successfully updated." }
        format.json { render :show, status: :ok, location: @moderador }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moderador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moderadors/1 or /moderadors/1.json
  def destroy
    @moderador.destroy!

    respond_to do |format|
      format.html { redirect_to moderadors_path, status: :see_other, notice: "Moderador was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moderador
      @moderador = Moderador.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def moderador_params
      params.expect(moderador: [ :usuario_id ])
    end
end
