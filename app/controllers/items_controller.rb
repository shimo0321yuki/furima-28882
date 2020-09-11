class ItemsController < ApplicationController
before_action :select_item, only:[:edit, :show, :destroy, :price]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def edit
  end

  def new
   @item = Item.new
  end

  def create
   @item = Item.create(item_params)
   redirect_to root_path
  end

  def show
  end

  def destroy
  end

  # def price
  #   binding.pry
  #   if item.price then
  #     item.new(price: true)
  #   else
  #     item.destroy(price: nil)
  #   end
  #   item = Item.find(params[:id])
  #   render json: { item: item }
  # end

  private

  def item_params
    params.require(:item).permit(:image, :name, :genre_id, :status_id, :delivery_fee_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end

end
