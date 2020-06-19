module CustomersHelper
  def kanji_full_name(customer)
    "#{customer.family_name_kanji}#{customer.first_name_kanji}"
  end
  def kana_full_name(customer)
    "#{customer.family_name_kana}#{customer.first_name_kana}"
  end
end