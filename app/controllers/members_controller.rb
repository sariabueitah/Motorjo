class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_user , only: [:edit_password , :update_password]
  before_action :authenticate_access!, :only => [:edit, :update, :destroy]
  
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member_cars = Car.where(user_id: @member.user.id).order('created_at DESC').page(params[:page]).per_page(10)
  end

  # GET /members/new
  def new
    @member = Member.new
    @member.build_user
  end

  # GET /members/1/edit
  def edit
  end
  def edit_password

  end
  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
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
  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
    def set_user
      @user = Member.find(current_user.id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:page ,:first_name, :last_name, :phone_number, :address, user_attributes: [ :id, :email, :password, :password_confirmation ])
    end
    def authenticate_access!
      if user_signed_in?
        if(current_user.meta_id == Member.find(params[:id]).id || current_user.isadmin)
          true
        else
          redirect_to @member
        end
      else
        redirect_to @member
      end
    end
end
