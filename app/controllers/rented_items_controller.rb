class RentedItemsController < ApplicationController
  before_action :set_rented_item, only: [:show, :edit, :update, :destroy]

  # GET /rented_items
  # GET /rented_items.json
  def index
    if params[:search]
      if params[:sort] != ""
        @rented_items = RentedItem.where(organization: User.find_by_id(session[:user_id]).organizations).search(params[:search]).order(params[:sort])
      else
        @rented_items = RentedItem.where(organization: User.find_by_id(session[:user_id]).organizations).search(params[:search]).order("item_id")
      end
    else
      if params[:sort] != ""
        @rented_items = RentedItem.where(organization: User.find_by_id(session[:user_id]).organizations).order(params[:sort])
      else
        @rented_items = RentedItem.where(organization: User.find_by_id(session[:user_id]).organizations).order("item_id")
      end
    end
  end

  # GET /rented_items/1
  # GET /rented_items/1.json
  def show
  end

  # GET /rented_items/new
  def new
    @rented_item = RentedItem.new
  end

  # GET /rented_items/1/edit
  def edit
  end

  # POST /rented_items
  # POST /rented_items.json
  def create
    @rented_item = RentedItem.new(rented_item_params)

    respond_to do |format|
      if @rented_item.save
        format.html { redirect_to @rented_item, notice: 'Rented item was successfully created.' }
        format.json { render :show, status: :created, location: @rented_item }
      else
        format.html { render :new }
        format.json { render json: @rented_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rented_items/1
  # PATCH/PUT /rented_items/1.json
  def update
    respond_to do |format|
      if @rented_item.update(rented_item_params)
        format.html { redirect_to @rented_item, notice: 'Rented item was successfully updated.' }
        format.json { render :show, status: :ok, location: @rented_item }
      else
        format.html { render :edit }
        format.json { render json: @rented_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rented_items/1
  # DELETE /rented_items/1.json
  def destroy
    @rented_item.destroy
    respond_to do |format|
      format.html { redirect_to rented_items_url, notice: 'Rented item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def return_item
    @rented_item = RentedItem.find_by_id(params[:id])
    @rented_item.return_item
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rented_item
      @rented_item = RentedItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rented_item_params
      params.require(:rented_item).permit(:organization, :organization_id, :item_id, :user_renting, :age, :date_rented, :return_date, :time_rented, :max_rent_time)
    end
end
