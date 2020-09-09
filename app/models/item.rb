class Item < ApplicationRecord
  has_one :good
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true

end
