class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment: { クレジットカード:  1, 銀行振込: 2}
  enum status: {入金待ち: 1,入金確認: 2,製作中: 3,発送準備中: 4,発送済み: 5}

  validates :postal_code, presence: true, length: { is: 7 }
  validates :address,:name,:payment,:total_fee,:select, presence: true
  attr_accessor :select,:shipping
end
