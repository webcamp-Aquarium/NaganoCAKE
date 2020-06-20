module ProductsHelper
  def tax_in_price(product)
    (product.price*1.1).round
  end
end
