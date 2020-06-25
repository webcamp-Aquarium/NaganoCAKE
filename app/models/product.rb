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

  def self.search(search)
    return Product.all unless search
    Product.where(["name LIKE ? OR description LIKE ?", "%#{search}%","%#{search}%"])
  end

end
