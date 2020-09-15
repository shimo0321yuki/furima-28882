class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_user, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    # @order = Order.find(params[:id])
  end

  def create
  end

  private

  def item_params
    params.require(:order).permit(:prefecture_id, :postal, :city, :address,
                                  :building_number, :phone, :purchaser, :price).merge(c)
  end

  def redirect_user
    if user_signed_in? == current_user[:user_id]
      redirect_to user_session_path
    end
  end
  
end
