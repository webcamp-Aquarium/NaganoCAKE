module CartItemsHelper
  def total_fee(resources) #複数のカートアイテムの配列を入れる
    fee = 0
    resources.each do |r|
      fee += (tax_in_price(r.product).to_i * r.number)
    end
    return fee.to_s(:delimited)
  end

  def subtotal_fee(resource) #一種類のカートアイテムを入れる
    (tax_in_price(resource.product).to_i * resource.number).to_s(:delimited)
  end
end