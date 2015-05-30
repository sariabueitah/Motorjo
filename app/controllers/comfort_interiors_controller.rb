class ComfortInteriorsController < ApplicationController
  before_action :set_comfort_interior, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /comfort_interiors
  # GET /comfort_interiors.json
  def index
    @comfort_interiors = ComfortInterior.all
  end

  # GET /comfort_interiors/1
  # GET /comfort_interiors/1.json
  def show
  end

  # GET /comfort_interiors/new
  def new
    @comfort_interior = ComfortInterior.new
  end

  # GET /comfort_interiors/1/edit
  def edit
  end

  # POST /comfort_interiors
  # POST /comfort_interiors.json
  def create
    @comfort_interior = ComfortInterior.new(comfort_interior_params)

    respond_to do |format|
      if @comfort_interior.save
        format.html { redirect_to @comfort_interior, notice: 'Comfort interior was successfully created.' }
        format.json { render :show, status: :created, location: @comfort_interior }
      else
        format.html { render :new }
        format.json { render json: @comfort_interior.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comfort_interiors/1
  # PATCH/PUT /comfort_interiors/1.json
  def update
    respond_to do |format|
      if @comfort_interior.update(comfort_interior_params)
        format.html { redirect_to @comfort_interior, notice: 'Comfort interior was successfully updated.' }
        format.json { render :show, status: :ok, location: @comfort_interior }
      else
        format.html { render :edit }
        format.json { render json: @comfort_interior.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comfort_interiors/1
  # DELETE /comfort_interiors/1.json
  def destroy
    @comfort_interior.destroy
    respond_to do |format|
      format.html { redirect_to comfort_interiors_url, notice: 'Comfort interior was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comfort_interior
      @comfort_interior = ComfortInterior.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comfort_interior_params
      params.require(:comfort_interior).permit(:title)
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
