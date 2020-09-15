class PurchaserOrder

  include ActiveModel::ActiveModel
  attr_accessor :user_id, :item_id, :prefecture_id, :postal, :city, :address, :building_number, :phone, :price, :purchaser_id

  with_options presence: true do
    # 'orderのバリデーション'
    validates :prefecture_id
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city, format: { with: /\A[一-龥ぁ-ん]\z/ }
    validates :address, format: { with: /\A[一-龥ぁ-ん][-]\d\z/ }
    validates :building_number
    validates :phone, format: { with: /\A\d{11}\z/}
    validates :purchaser_id
    validates :price
    # 'purchaseのバリデーション'
    validates :user_id
    validates :item_id
  end

  def ssave
   order = Order.create(prefecture_id: prefecture_id, postal: postal, city: city,
                        address: address, building_number: building_number, phone: phone,
                        purchaser_id: purchaser_id, price: price)

   purchaser = Purchaser.create(user_id: user_id, item_id: item_id)
  end
end