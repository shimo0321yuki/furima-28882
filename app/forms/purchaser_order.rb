class PurchaserOrder

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, 
                :prefecture_id, :postal, :city, :address, :building_number, :phone, :token

  with_options presence: true do
    # 'orderのバリデーション'
    validates :prefecture_id
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone, format: { with: /\A\d{,11}\z/ }
  end

  def save
   purchaser = Purchaser.create(user_id: user_id, item_id: item_id)

   order = Order.create(prefecture_id: prefecture_id, postal: postal, city: city,
                        address: address, building_number: building_number, phone: phone,
                        purchaser_id: purchaser.id)
   
  end
end