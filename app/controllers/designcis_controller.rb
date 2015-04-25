class DesigncisController < ApplicationController
  before_action :set_designci, only: [:show, :edit, :update, :destroy]

  # GET /designcis
  # GET /designcis.json
  def index
    @designcis = Designci.all
  end

  # GET /designcis/1
  # GET /designcis/1.json
  def show
  end

  # GET /designcis/new
  def new
    @designci = Designci.new
  end

  # GET /designcis/1/edit
  def edit
  end

  # POST /designcis
  # POST /designcis.json
  def create
    @designci = Designci.new(designci_params)

    respond_to do |format|
      if @designci.save
        format.html { redirect_to @designci, notice: 'Designci was successfully created.' }
        format.json { render :show, status: :created, location: @designci }
      else
        format.html { render :new }
        format.json { render json: @designci.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designcis/1
  # PATCH/PUT /designcis/1.json
  def update
    respond_to do |format|
      if @designci.update(designci_params)
        format.html { redirect_to @designci, notice: 'Designci was successfully updated.' }
        format.json { render :show, status: :ok, location: @designci }
      else
        format.html { render :edit }
        format.json { render json: @designci.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designcis/1
  # DELETE /designcis/1.json
  def destroy
    @designci.destroy
    respond_to do |format|
      format.html { redirect_to designcis_url, notice: 'Designci was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_designci
      @designci = Designci.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def designci_params
      params.require(:designci).permit(:title)
    end
end
