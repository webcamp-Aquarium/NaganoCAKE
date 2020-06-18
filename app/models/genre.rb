class Genre < ApplicationRecord
  has_many :products
  enum is_status: { 無効: false, 有効: true }
end
