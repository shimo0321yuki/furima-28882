require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryBot.create(:order) }
 before do
  @order = FactoryBot.build(:order)
end

describe '商品購入機能' do
  it 'クレジットカード情報が必須であること' do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end

  it '郵便番号が必須であること' do
    @order.postal = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal can't be blank")
  end

  it '郵便番号にはハイフンが必要であること' do
    @order.postal = 0000000
    @order.valid?
    expect(@order.errors.full_messages).to include("Postal is invalid")
  end

  it '都道府県が必須であること' do
    @order.prefecture_id = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Prefecture can't be blank")
  end

  it '市区町村が必須であること' do
    @order.city = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("city can't be blank")
  end

  it '番地が必須であること' do
    @order.address = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Address can't be blank")
  end

  it '電話番号が必須であること' do
    @order.phone = nil
     item.valid?
    expect(@order.errors.full_messages).to include("Phone can't be blank")
  end

  it '電話番号は１１桁以内であること' do
    @order.phone = 000000000000
     item.valid?
    expect(@order.errors.full_messages).to include("Phone is invalid")
  end
  it '' do
    @order.name = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Name can't be blank")
  end

end