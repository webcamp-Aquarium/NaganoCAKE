class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :product_id
      # 1.着手不可 2.製作待ち 3.製作中 4.製作完了
      t.integer :production_status,null: false,default: 1
      t.integer :price
      t.integer :number

      t.timestamps
    end
  end
end
