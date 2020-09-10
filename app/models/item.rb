class Item < ApplicationRecord
  has_one :good
  belongs_to :user
  has_one_attached :image
  has_one :comment

  validates :price, format: { with: /[0-9]/ }, inclusion: {in: 300..9999999 } 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
  belongs_to_active_hash :days
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :genre
  belongs_to_active_hash :status

 with_options presence: true do
  validates :genre_id
  validates :status_id
  validates :delivery_fee_id
  validates :area_id
  validates :days_id
 end 
end
