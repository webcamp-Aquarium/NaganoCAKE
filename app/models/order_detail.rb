class OrderDetail < ApplicationRecord
	belongs_to :order
	belongs_to :product

	enum production_status: {着手不可: 1, 製作待ち: 2, 製作中: 3, 製作完了: 4}
end
