class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_user, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    # @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(price: order_params[:price])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:prefecture_id, :postal, :city, :address,
                                  :building_number, :phone, :purchaser, :price).merge(c)
  end

  def redirect_user
    if user_signed_in? == current_user[:user_id]
      redirect_to user_session_path
    end
  end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_5d821fce29033fa3320389d7"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
