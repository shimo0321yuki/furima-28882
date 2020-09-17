class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_user, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = PurchaserOrder.new
  end

  def create
    @order = PurchaserOrder.new(order_params)
    @item = Item.find(params[:item_id])
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:purchaser_order).permit(:prefecture_id, :postal, :city, :address, :building_number, :phone)
    .merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def redirect_user
    if user_signed_in? == current_user[:user_id]
      redirect_to user_session_path
    end
  end

  def pay_item
    Payjp.api_key = "sk_test_5d821fce29033fa3320389d7"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end

end
