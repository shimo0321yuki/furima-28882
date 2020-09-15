class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:id])
    # @order = Order.find(params[:id])
  end

  def create
  end

  private

  def item_params
    params.require(:order).permit(:prefecture_id, :postal, :city, :address, 
                                  :building_number, :phone, :purchaser, :price).merge(c)
  end
  
end
