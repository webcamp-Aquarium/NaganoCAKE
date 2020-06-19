module CartItemsHelper
  def total_fee(resources)
    fee = 0
    resources.each do |r|
      fee += tax_in_price(r.product)*r.number
    end
    return fee
  end
end
