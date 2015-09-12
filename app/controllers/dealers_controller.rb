class DealersController < ApplicationController
  before_action :set_dealer, only: [:show, :edit, :update, :destroy]
  before_action :set_user , only: [:edit_password , :update_password]
  before_action :authenticate_access!, :only => [:edit, :update, :destroy]
  # GET /dealers
  # GET /dealers.json
  def index
    @dealers = Dealer.all
  end

  # GET /dealers/1
  # GET /dealers/1.json
  def show
    @dealer_cars = Car.where(user_id: @dealer.user.id).order('created_at DESC').page(params[:page]).per_page(10)
    @latest_cars = Car.last(10)
  end

  def edit_password

  end
  
  # GET /dealers/new
  def new
    @dealer = Dealer.new
    @dealer.build_user
  end

  # GET /dealers/1/edit
  def edit
  end

  # POST /dealers
  # POST /dealers.json
  def create
    @dealer = Dealer.new(dealer_params)
    respond_to do |format|
      if @dealer.save
        format.html { redirect_to @dealer, notice: 'Dealer was successfully created.' }
        format.json { render :show, status: :created, location: @dealer }
      else
        format.html { render :new }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/edit/password
  # PATCH/PUT 
  def update_password
    respond_to do |format|
      if @user.update(dealer_params)
        format.html { redirect_to @user, notice: 'Dealer Password was successfully updated. Please login again' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dealers/1
  # PATCH/PUT /dealers/1.json
  def update
    respond_to do |format|
      if @dealer.update(dealer_params)
        format.html { redirect_to @dealer, notice: 'Dealer was successfully updated.' }
        format.json { render :show, status: :ok, location: @dealer }
      else
        byebug
        format.html { render :edit }
        format.json { render json: @dealer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealers/1
  # DELETE /dealers/1.json
  def destroy
    @dealer.destroy
    respond_to do |format|
      format.html { redirect_to dealers_url, notice: 'Dealer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dealer
      @dealer = Dealer.find(params[:id])
    end

    def set_user
      @user = Dealer.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dealer_params
      params.require(:dealer).permit(:page, :name, :mobile_number, :city, :gallery_name, :phone_number, :gallery_location, :street_name, :building_number, user_attributes: [ :id, :email, :password, :password_confirmation ])
    end
    
    def authenticate_access!
      if user_signed_in?
        if(current_user.meta_id == Dealer.find(params[:id]).id || current_user.isadmin)
          true
        else
          redirect_to @dealer
        end
      else
        redirect_to @dealer
      end
    end
end
