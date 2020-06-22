module OrdersHelper
  def customer_joint_address(resource)
    [resource.postal_code,resource.address,kanji_full_name(resource)].join(' ')
  end

  def shipping_address(resource)
    [resource.postal_code,resource.address,resource.name].join(' ')
  end

  def shipping_array(customer)
    shippings_of_customer = []
    shippings = Shipping.where(customer_id: customer.id)
    shippings.each do |s|
      shippings_of_customer << shipping_address(s)
    end
    shippings_of_customer
  end

  def find_product_name(order) # 注文データ一つ分を代入する
    order_details = OrderDetail.where(order_id: order.id).pluck(:product_id)
    Product.find(order_details).pluck(:name)
  end

end
