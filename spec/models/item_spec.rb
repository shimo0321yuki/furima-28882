require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { FactoryBot.create(:item) }
  before do
    @item = FactoryBot.build(:item)
    # userをfactoryBot経由で定義する
  end

  describe '商品出品機能' do
    it '画像が１枚必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が必須であること' do
      @item.information = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Information can't be blank")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.genre_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Genre can't be blank")
    end

    it '商品状態についての情報が必須であること' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.delivery_fee_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.days_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Days can't be blank")
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end

    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = '¥299'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '販売価格は半角数字のみ入力可能であること' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
