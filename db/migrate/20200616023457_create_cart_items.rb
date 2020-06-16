class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :customer_id,foreign_key: true
      t.integer :product_id,foreign_key: true

      ## 個数　カートに入れられた段階で、個数１が渡される
      t.integer :number, null: false, default: 1

      t.timestamps
    end
  end
end
