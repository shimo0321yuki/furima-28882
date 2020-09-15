class Order < ApplicationRecord
  with_options presence: true do
    validates :prefecture_id
    validates :postal
    validates :city
    validates :address
    validates :building_number
    validates :phone
    validates :purchaser
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :prefecture
   belongs_to :purchaser
   belongs_to :item
end
