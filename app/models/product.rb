class Product < ApplicationRecord
  belongs_to :genre
  has_many :order_details
  has_many :cart_items, dependent: :destroy
  enum is_status: { 売切れ: false, 販売中: true }
  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
  attachment :image
end
