class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :redirect_user, only: [:index]
  before_action :redirect_item, only: [:index]

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
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:purchaser_order).permit(:prefecture_id, :postal, :city, :address, :building_number, :phone)
          .merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def redirect_user
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
  end

  def redirect_item
    redirect_to root_path if @item.purchaser.present?
  end
end
