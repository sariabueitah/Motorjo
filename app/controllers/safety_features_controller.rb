class SafetyFeaturesController < ApplicationController
  before_action :set_safety_feature, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  # GET /safety_features
  # GET /safety_features.json
  def index
    @safety_features = SafetyFeature.all
  end

  # GET /safety_features/1
  # GET /safety_features/1.json
  def show
  end

  # GET /safety_features/new
  def new
    @safety_feature = SafetyFeature.new
  end

  # GET /safety_features/1/edit
  def edit
  end

  # POST /safety_features
  # POST /safety_features.json
  def create
    @safety_feature = SafetyFeature.new(safety_feature_params)

    respond_to do |format|
      if @safety_feature.save
        format.html { redirect_to @safety_feature, notice: 'Safety feature was successfully created.' }
        format.json { render :show, status: :created, location: @safety_feature }
      else
        format.html { render :new }
        format.json { render json: @safety_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /safety_features/1
  # PATCH/PUT /safety_features/1.json
  def update
    respond_to do |format|
      if @safety_feature.update(safety_feature_params)
        format.html { redirect_to @safety_feature, notice: 'Safety feature was successfully updated.' }
        format.json { render :show, status: :ok, location: @safety_feature }
      else
        format.html { render :edit }
        format.json { render json: @safety_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /safety_features/1
  # DELETE /safety_features/1.json
  def destroy
    @safety_feature.destroy
    respond_to do |format|
      format.html { redirect_to safety_features_url, notice: 'Safety feature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_safety_feature
      @safety_feature = SafetyFeature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def safety_feature_params
      params.require(:safety_feature).permit(:title)
    end
    def authenticate_admin!
      if user_signed_in?
        if(current_user.isadmin)
          true
        else
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
end
