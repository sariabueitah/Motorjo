class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_user , only: [:update_password, :edit]
  before_action :authenticate_access!, :only => [:index ,:edit, :update]
  before_action :authenticate_admin!,:only =>[:admin_member ,:index, :destroy]
  
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member_cars = Car.where(user_id: @member.user.id).order('created_at DESC').page(params[:page]).per_page(10)
    @latest_cars = Car.last(10)
  end

  # GET /members/new
  def new
    @member = Member.new
    @member.build_user
  end

  # GET /members/1/edit
  def edit
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
      if @user.update(member_params)
        format.html { redirect_to @user, notice: 'Member Password was successfully updated. Please login again' }
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
      format.html { redirect_to admin_member_members_path, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def admin_member
    @members = Member.includes(:user).all.page(params[:page]).per_page(50)
  end
  def admin_member_update
    params['user'].keys.each do |id|
      @user = User.find(id.to_i)
      @user.update_attributes(admin_user_params(id))
    end
    if(authenticate_admin?)
      redirect_to(admin_member_members_path)
    else
      redirect_to root_path
    end
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end
    def set_user
      user = User.find(current_user.id)
      @user = Member.find(user.meta_id)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:page ,:first_name, :last_name, :phone_number, :address, user_attributes: [ :id, :email, :password, :password_confirmation ])
    end
    def admin_user_params(id)
      params.require(:user).fetch(id).permit(:isadmin)
    end
    def authenticate_access!
      if user_signed_in?
        if(current_user.meta_id == Member.find(params[:id]).id || current_user.isadmin)
          true
        else
          if(@member)
            redirect_to @member
          else
            redirect_to :root
          end
        end
      else
        if(@member)
            redirect_to @member
          else
            redirect_to :root
          end
      end
    end
end
