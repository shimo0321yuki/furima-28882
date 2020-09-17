require 'rails_helper'

RSpec.describe PurchaserOrder, type: :model do
  # let(:order) { FactoryBot.create(:order) }
  before do
    # user = FactoryBot.create(:user)
    # item = FactoryBot.create(:item)
    # @purchaser_order = FactoryBot.build(:purchaser_order, user_id: user.id, item_id: item.id)
    @purchaser_order = FactoryBot.build(:purchaser_order)
  end

  describe '商品購入機能' do
    it 'クレジットカード情報が必須であること' do
      @purchaser_order.token = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が必須であること' do
      @purchaser_order.postal = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("Postal can't be blank")
    end

    it '郵便番号にはハイフンが必要であること' do
      @purchaser_order.postal = 0o000000
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include('Postal is invalid')
    end

    it '都道府県が必須であること' do
      @purchaser_order.prefecture_id = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が必須であること' do
      @purchaser_order.city = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @purchaser_order.address = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が必須であること' do
      @purchaser_order.phone = ' '
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include("Phone can't be blank")
    end

    it '電話番号は１１桁以内であること' do
      @purchaser_order.phone = 0o00000000000
      @purchaser_order.valid?
      expect(@purchaser_order.errors.full_messages).to include('Phone is invalid')
    end
  end
end
