require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe '商品出品機能' do
  it '画像が１枚必須であること' do
    @application_record.image = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("")
  end

  it '商品名が必須であること' do
    @item.name = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '商品の説明（コメント）が必須であること' do
    @item.comment = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it 'カテゴリーの情報が必須であること' do
    @item.genre_id = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '商品状態についての情報が必須であること' do
    @item.status_id = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '配送料の負担についての情報が必須であること' do
    @item.delivery_fee_id = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '発送元の地域についての情報が必須であること' do
    @item.area_id = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '発送までの日数についての情報が必須であること' do
    @item.days_id = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '価格についての情報が必須であること' do
    @item.price = nil
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '価格の範囲が、¥300~¥9,999,999の間であること' do
    @item.price = "¥299"
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  it '販売価格は半角数字のみ入力可能であること' do
    @item.price = "３００"
    @user.valid?
    expect(@user.errors.full_messages).to include("")
  end

  

 