class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :good
  belongs_to :user
  has_one_attached :image
  has_one :comment

  # validates :content, presence: true
  validates :genre_id, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id, presence: true
  validates :days_id, presence: true
  validates :price, format: { with: /[0-9]/ }, inclusion: {in: ¥300..¥9,999,999 } presence: true

end
