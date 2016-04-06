class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:new, :create]
  before_action :authenticate_access!, :only => [:edit, :update, :destroy]

  # GET /cars
  # GET /cars.json
  def index
    if params[:q]

      if params[:q][:sort]
        case params[:q][:sort]
        when "1"
          column = "created_at"
          type = "desc"
        when "2"
          column = "created_at"
          type = "asc"
        when "3"
          column = "price"
          type = "desc"
        when "4"
          column = "price"
          type = "asc"
        when "5"
          column = "year"
          type = "desc"
        when "6"
          column = "year"
          type = "desc"
        end
      else
        column = "created_at"
        type = "desc"
      end
      @search = Car.search do
        with(:car_make).equal_to(params[:q][:car_make]) if params[:q][:car_make].present?
        with(:car_model).equal_to(params[:q][:car_model]) if params[:q][:car_model].present?
        with(:cubic_capacity).greater_than_or_equal_to(params[:q][:cubic_capacity_from].to_i) if params[:q][:cubic_capacity_from].present?
        with(:cubic_capacity).less_than_or_equal_to(params[:q][:cubic_capacity_to].to_i) if params[:q][:cubic_capacity_to].present?
        with(:year).greater_than_or_equal_to(params[:q][:year_from].to_i) if params[:q][:year_from].present?
        with(:year).less_than_or_equal_to(params[:q][:year_to].to_i) if params[:q][:year_to].present?
        with(:price).greater_than_or_equal_to(params[:q][:price_from].to_i) if params[:q][:price_from].present?
        with(:price).less_than_or_equal_to(params[:q][:price_to].to_i) if params[:q][:price_to].present?
        with(:gearbox_id).equal_to(params[:q][:gearbox_id]) if params[:q][:gearbox_id].present?
        with(:fuel_type).equal_to(params[:q][:fuel_type]) if params[:q][:fuel_type].present?
        with(:color_id).equal_to(params[:q][:color_id]) if params[:q][:color_id].present?
        with(:report).equal_to(params[:q][:report]) if params[:q][:report].present?
        with(:comfort_interior_ids).all_of(params[:q][:comfort_interior_ids]) if params[:q][:comfort_interior_ids].present?
        with(:safety_feature_ids).all_of(params[:q][:safety_feature_ids]) if params[:q][:safety_feature_ids].present?
        order_by column, type
        paginate :page => params[:page] || 1, :per_page => 50
      end
      @cars = @search.results
    else
      @cars = Car.all.page(params[:page]).per_page(50)
    end
    @special_cars = Car.where(special_car: true)
    @latest_cars = Car.last(50)
  end

  # GET /cars/1
  # GET /cars/1.json
  def show
    @user = User.find(@car.user_id)
    @latest_cars = Car.last(10)
    if(@user.meta_type == "Dealer")
      @page_author = request.original_url + dealer_path(@user.meta_id)
      @page_publisher = request.original_url + dealer_path(@user.meta_id)
    else
      @page_author = request.original_url + member_path(@user.meta_id)
      @page_publisher = request.original_url + member_path(@user.meta_id)
    end
  end

  # GET /cars/new
  def new
    @car = Car.new
    if current_user.meta_type == "Member"
      5.times { @car.car_images.build }
    end
    if current_user.meta_type == "Dealer"
      12.times { @car.car_images.build }
    end

  end

  # GET /cars/1/edit
  def edit
    if current_user.meta_type == "Dealer"
        image_count = @car.car_images.size
        image_count = 12-image_count
        image_count.times { @car.car_images.build }
    end
    if current_user.meta_type == "Member"
        image_count = @car.car_images.size
        image_count = 5-image_count
        image_count.times { @car.car_images.build }
    end
    @latest_cars = Car.last(10)
  end

  # POST /cars
  # POST /cars.json
  def create
    car_params.delete(:special_car) unless current_user.isadmin
    @car = Car.new(car_params)
    @car.user_id = current_user.id
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        if current_user.meta_type == "Dealer"
            image_count = @car.car_images.size
            image_count = 12-image_count
            image_count.times { @car.car_images.build }
        end
        if current_user.meta_type == "Member"
            image_count = @car.car_images.size
            image_count = 5-image_count
            image_count.times { @car.car_images.build }
        end
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    car_params.delete(:special_car) unless current_user.isadmin
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def contact_submit
    @car = Car.find(params[:carId])
    ContactMailer.contact_email(params[:senderName], params[:senderEmail], params[:senderMessage], Car.find(params[:carId]), User.find(params[:ownerId])).deliver_now
    redirect_to @car, notice: 'Car was successfully created.'
  end
  def admin_car
    @cars = Car.includes(:user).all.page(params[:page]).per_page(50)
  end
  def admin_car_update
    params['car'].keys.each do |id|
      @car = Car.find(id.to_i)
      @car.update_attributes(admin_car_params(id))
    end
    redirect_to(admin_car_cars_path)
  end
  def delete_image
    image = CarImage.find(params[:id]).destroy
    redirect_to edit_car_path(image.car_id)+"#Description"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def car_params
      params.require(:car).permit(:sort,:remove_image,:title, :description, :year, :mileage, :price, :car_location, :contact_number, :report, :report_other, :gearbox_id, :color_id, :car_make, :car_model, :interior_design_id, :fuel_type, :cubic_capacity, :special_car, :interior_color_id, :city, :safety_feature_ids => [], :comfort_interior_ids => [], car_images_attributes: [:id, :image, :_destroy, :image_cache])
    end
    def admin_car_params(id)
      params.require(:car).fetch(id).permit(:special_car)
    end
    def authenticate_access!
      if user_signed_in?
        if(current_user.id == Car.find(params[:id]).user_id || current_user.isadmin)
          true
        else
          redirect_to @car
        end
      else
        redirect_to @car
      end
    end
end
