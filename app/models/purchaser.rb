class Purchaser < ApplicationRecord
  with_options presence: true do
    validates :user
    validates :item
  end
end
