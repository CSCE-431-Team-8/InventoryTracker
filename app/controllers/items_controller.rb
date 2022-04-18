class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :increase_quantity, :decrease_quantity]
  # skip_before_filter :require_login, only: [:index, :show]

  # GET /items
  # GET /items.json
  def index
    if params[:search]
      # @items = Item.search(params[:search])
      if params[:sort] != "quantity_remaining"
        @items = Item.where(organization: User.find_by_id(session[:user_id]).organizations).search(params[:search]).order(params[:sort])
      elsif params[:sort] == "quantity_remaining"
        @items = Item.where(organization: User.find_by_id(session[:user_id]).organizations).search(params[:search]).sort_by{|item| item.quantity_remaining / item.quantity_total}
      else
        @items = Item.where(organization: User.find_by_id(session[:user_id]).organizations).search(params[:search]).order("id")
      end
    else
      if params[:sort] != "quantity_remaining"
        @items = Item.where(organization: User.find_by_id(session[:user_id]).organizations).order(params[:sort])
      elsif params[:sort] == "quantity_remaining"
        @items = Item.where(organization: User.find_by_id(session[:user_id]).organizations).sort_by{|item| item.quantity_remaining / item.quantity_total}
      else
        @items = Item.where(organization: User.find_by_id(session[:user_id]).organizations).order("id")
      end
    end
  end

  def search_items
    if @item = Item.all.find{|item| item.name.include?(params[:search])}
      redirect_to item_path(@item)
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def increase_quantity
    @item = Item.find_by_id(params[:id])
    @item.increment!(:quantity_remaining, params[:quantity].to_i)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def decrease_quantity
    @item = Item.find_by_id(params[:id])
    @item.decrement!(:quantity_remaining, params[:quantity].to_i)
    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
  end

  def rent_item
    @item = Item.find_by_id(params[:id])
    @item.decrement!(:quantity_remaining, 1)
    @rented_item = RentedItem.new
    @rented_item.item = @item
    @rented_item.item_id = @item.id
    @rented_item.user_renting = current_user().name
    @rented_item.date_rented = Date.today.to_s
    @rented_item.return_date = Date.today + 14
    @rented_item.organization = @item.organization
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:id, :organization, :organization_id, :location, :name, :description, :quantity_remaining, :quantity_total, :rentable, :price)
    end

end
