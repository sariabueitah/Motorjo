class InteriorDesignsController < ApplicationController
  before_action :set_interior_design, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /interior_designs
  # GET /interior_designs.json
  def index
    @interior_designs = InteriorDesign.all
  end

  # GET /interior_designs/1
  # GET /interior_designs/1.json
  def show
  end

  # GET /interior_designs/new
  def new
    @interior_design = InteriorDesign.new
  end

  # GET /interior_designs/1/edit
  def edit
  end

  # POST /interior_designs
  # POST /interior_designs.json
  def create
    @interior_design = InteriorDesign.new(interior_design_params)

    respond_to do |format|
      if @interior_design.save
        format.html { redirect_to interior_design_path, notice: 'Interior design was successfully created.' }
        format.json { render :show, status: :created, location: @interior_design }
      else
        format.html { render :new }
        format.json { render json: @interior_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interior_designs/1
  # PATCH/PUT /interior_designs/1.json
  def update
    respond_to do |format|
      if @interior_design.update(interior_design_params)
        format.html { redirect_to interior_design_path, notice: 'Interior design was successfully updated.' }
        format.json { render :show, status: :ok, location: @interior_design }
      else
        format.html { render :edit }
        format.json { render json: @interior_design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interior_designs/1
  # DELETE /interior_designs/1.json
  def destroy
    @interior_design.destroy
    respond_to do |format|
      format.html { redirect_to interior_designs_url, notice: 'Interior design was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interior_design
      @interior_design = InteriorDesign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interior_design_params
      params.require(:interior_design).permit(:title)
    end
end
