class Order < ApplicationRecord
  with_options presence: true do
    validates :prefecture_id
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :city, format: { with: /\A[一-龥ぁ-ん]\z/ }
    validates :address, format: { with: /\A[一-龥ぁ-ん][-]\d\z/ }
    validates :building_number
    validates :phone, format: { with: /\A\d{11}\z/}
    validates :purchaser
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :prefecture
   belongs_to :purchaser
   belongs_to :item
   belongs_to :user
end
