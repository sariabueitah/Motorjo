class InteriorColorsController < ApplicationController
  before_action :set_interior_color, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /interior_colors
  # GET /interior_colors.json
  def index
    @interior_colors = InteriorColor.all
  end

  # GET /interior_colors/1
  # GET /interior_colors/1.json
  def show
  end

  # GET /interior_colors/new
  def new
    @interior_color = InteriorColor.new
  end

  # GET /interior_colors/1/edit
  def edit
  end

  # POST /interior_colors
  # POST /interior_colors.json
  def create
    @interior_color = InteriorColor.new(interior_color_params)

    respond_to do |format|
      if @interior_color.save
        format.html { redirect_to @interior_color, notice: 'Interior color was successfully created.' }
        format.json { render :show, status: :created, location: @interior_color }
      else
        format.html { render :new }
        format.json { render json: @interior_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /interior_colors/1
  # PATCH/PUT /interior_colors/1.json
  def update
    respond_to do |format|
      if @interior_color.update(interior_color_params)
        format.html { redirect_to @interior_color, notice: 'Interior color was successfully updated.' }
        format.json { render :show, status: :ok, location: @interior_color }
      else
        format.html { render :edit }
        format.json { render json: @interior_color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /interior_colors/1
  # DELETE /interior_colors/1.json
  def destroy
    @interior_color.destroy
    respond_to do |format|
      format.html { redirect_to interior_colors_url, notice: 'Interior color was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_interior_color
      @interior_color = InteriorColor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def interior_color_params
      params.require(:interior_color).permit(:title)
    end
    def authenticate_admin!
      if user_signed_in?
        if(current_user.meta_type === "admin")
          true
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
end
