class ItemsController < ApplicationController
  before_action :select_item, only: [:edit, :show, :destroy, :price]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :information, :genre_id, :status_id,
                                 :delivery_fee_id, :area_id, :days_id, :price).merge(user_id: current_user.id)
  end

  def select_item
    @item = Item.find(params[:id])
  end
end
