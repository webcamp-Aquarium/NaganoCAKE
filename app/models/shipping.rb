class Shipping < ApplicationRecord
	belongs_to :customer
  validates :postal_code,presence: true, length: { is: 7 }
  validates :address,:name,presence: true
end
