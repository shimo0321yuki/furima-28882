class PurchaserController < ApplicationController
  def new
    @purchaser = PurchaserOrder.new
  end

  def create
    @purchaser = PurchaserOrder.create(purchaser_order_params)
    @purchaser.save
  end

  def show
    @purchasers = current_user.purchaser(item)
  end

  private

  def purchaser_params
    params.require(:purchaser_order).permit(:user_id, :item_id, :prefecture_id, :postal, :city,
                                            :address, :building_number, :phone, :purchaser, :price)
  end
end
