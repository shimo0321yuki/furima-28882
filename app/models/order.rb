class Order < ApplicationRecord
  with_options presence: true do
    validates :prefecture_id
    validates :postal
    validates :city
    validates :address
    validates :building_number
    validates :phone
    validates :purchaser
  end
end
