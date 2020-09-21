require 'rails_helper'

RSpec.describe PurchaserOrder, type: :model do
  before do
    @purchaser_order = FactoryBot.build(:purchaser_order)
  end

  describe '商品購入機能' do
    it '全ての値が存在すれば保存できること' do
      expect(@purchaser_order).to be_valid
    end

    it '建物名が空であっても保存できること' do
      @purchaser_order.building_number = ' '
      expect(@purchaser_order).to be_valid
    end
    
    it 'クレジットカード情報が必須であること' do
      @purchaser_order.token = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("カード情報を入力してください")
    end

    it '郵便番号が必須であること' do
      @purchaser_order.postal = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("郵便番号を入力してください")
    end

    it '郵便番号にはハイフンが必要であること' do
      @purchaser_order.postal = 0o000000
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it '都道府県が必須であること' do
      @purchaser_order.prefecture_id = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("都道府県を入力してください")
    end

    it '市区町村が必須であること' do
      @purchaser_order.city = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("市区町村を入力してください")
    end

    it '番地が必須であること' do
      @purchaser_order.address = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("番地を入力してください")
    end

    it '電話番号が必須であること' do
      @purchaser_order.phone = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("電話番号を入力してください")
    end

    it '電話番号は１１桁以内であること' do
      @purchaser_order.phone = 0o00000000000
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("電話番号は不正な値です")
    end
  end
end
