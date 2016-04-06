class Admin::MainSlidersController < ApplicationController
  before_action :set_admin_main_slider, only: [:show, :edit, :update, :destroy]

  # GET /admin/main_sliders
  # GET /admin/main_sliders.json
  def index
    @admin_main_sliders = Admin::MainSlider.all
  end

  # GET /admin/main_sliders/1
  # GET /admin/main_sliders/1.json
  def show
  end

  # GET /admin/main_sliders/new
  def new
    @admin_main_slider = Admin::MainSlider.new
  end

  # GET /admin/main_sliders/1/edit
  def edit
  end

  # POST /admin/main_sliders
  # POST /admin/main_sliders.json
  def create
    @admin_main_slider = Admin::MainSlider.new(admin_main_slider_params)

    respond_to do |format|
      if @admin_main_slider.save
        format.html { redirect_to @admin_main_slider, notice: 'Main slider was successfully created.' }
        format.json { render :show, status: :created, location: @admin_main_slider }
      else
        format.html { render :new }
        format.json { render json: @admin_main_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/main_sliders/1
  # PATCH/PUT /admin/main_sliders/1.json
  def update
    respond_to do |format|
      if @admin_main_slider.update(admin_main_slider_params)
        format.html { redirect_to @admin_main_slider, notice: 'Main slider was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_main_slider }
      else
        format.html { render :edit }
        format.json { render json: @admin_main_slider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/main_sliders/1
  # DELETE /admin/main_sliders/1.json
  def destroy
    @admin_main_slider.destroy
    respond_to do |format|
      format.html { redirect_to admin_main_sliders_url, notice: 'Main slider was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_main_slider
      @admin_main_slider = Admin::MainSlider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_main_slider_params
      params.require(:admin_main_slider).permit(:image,:title, :description, :order, :color, :position, :title_direction, :description_direction)
    end
end
