class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :select_item, only: [:edit, :show, :destroy, :update]

  def index
    @items = Item.all.order("created_at DESC")
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
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
