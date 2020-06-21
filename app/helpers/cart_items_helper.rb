module CartItemsHelper
  def total_fee(resources) #複数のカートアイテムの配列を入れる
    fee = 0
    resources.each do |r|
      fee += (subtotal_fee(r))
    end
    return fee
  end

  def subtotal_fee(resource) #一種類のカートアイテムを入れる
    (tax_in_price(resource.product) * resource.number)
  end
end