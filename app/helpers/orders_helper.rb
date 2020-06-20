module OrdersHelper
  def customer_joint_address(resource)
    "#{resource.postal_code}\s#{resource.address}\s#{kanji_full_name(resource)}"
  end

  def shipping_address_array(resource)
    [resource.postal_code,resource.address,resource.name]
  end

  def shipping_array(customer)
    shippings_of_customer = []
    shippings = Shipping.where(customer_id: customer.id)
    shippings.each do |s|
      shippings_of_customer << shipping_address_array(s)
    end
    shippings_of_customer
  end
end
