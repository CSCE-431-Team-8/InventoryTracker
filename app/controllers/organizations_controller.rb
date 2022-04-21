class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  def join_org
    @org = Organization.find_by_id(params[:id])
    @user = User.find_by_id(session[:user_id])
    @org.join_org(@user)
  end

  def items
    @organization = Organization.find_by_id(params[:id])
    if params[:search]
      # @items = Item.search(params[:search])
      if params[:sort] != "quantity_remaining"
        @items = Item.where(organization: params[:id]).search(params[:search]).order(params[:sort])
      elsif params[:sort] == "quantity_remaining"
        @items = Item.where(organization: params[:id]).search(params[:search]).sort_by{|item| item.quantity_remaining / item.quantity_total}
      else
        @items = Item.where(organization: params[:id]).search(params[:search]).order("id")
      end
    else
      if params[:sort] != "quantity_remaining"
        @items = Item.where(organization: params[:id]).order(params[:sort])
      elsif params[:sort] == "quantity_remaining"
        @items = Item.where(organization: params[:id]).sort_by{|item| item.quantity_remaining / item.quantity_total}
      else
        @items = Item.where(organization: params[:id]).order("id")
      end
    end
  end

  def members
    @organization = Organization.find_by_id(params[:id])
    @members = Membership.where(organization: params[:id])
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    @membership = Membership.create!(organization: @organization, user: current_user, admin: true)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = Organization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name)
    end
end
