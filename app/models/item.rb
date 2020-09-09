class Item < ApplicationRecord
  has_one :good
  belongs_to :user
  has_one_attached :image
  has_one_attached :comment

  validates :content, presence: true

end
