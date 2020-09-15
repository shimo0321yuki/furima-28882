class Item < ApplicationRecord
  def was_attached?
    image.attached?
  end

  with_options presence: true do
    validates :price, format: { with: /[0-9]/ }, inclusion: { in: 300..9_999_999 }
    validates :image
    validates :genre_id
    validates :status_id
    validates :delivery_fee_id
    validates :area_id
    validates :days_id
    validates :name
    validates :information
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  has_one :purchaser
  belongs_to :user
  has_one_attached :image
end
