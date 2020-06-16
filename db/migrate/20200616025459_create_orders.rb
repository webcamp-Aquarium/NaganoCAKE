class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      # 1.入金待ち　2.入金確認　3.製作中　4.発送準備中　5.発送済み
      t.integer :status,null: false,default: 1
      t.integer :payment
      t.string :potal_code
      t.string :address
      t.string :name
      t.integer :total_fee
      t.integer :delivery_fee,default: 800

      t.timestamps
    end
  end
end
