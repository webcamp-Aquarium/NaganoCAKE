require 'rails_helper'
RSpec.describe Customer, type: :model do
  context "データが正しく保存される" do
    before do
      @customer = Customer.new
      @customer.family_name_kanji = "佐藤"
      @customer.first_name_kanji = "次郎"
      @customer.family_name_kana = "サトウ"
      @customer.first_name_kana = "ジロウ"
      @customer.email = "satou@satou.com"
      @customer.postal_code = "2222222"
      @customer.address = "埼玉県さいたま市"
      @customer.phone = "12345678900"
      @customer.password = "111111"
      @customer.save
    end
    it '全て入力してあるので保存される' do
      expect(@customer).to be_valid
    end
  end
  context "データが正しく保存されない" do
    before do
      @customer = Customer.new
      @customer.family_name_kanji = ""
      @customer.first_name_kanji = ""
      @customer.family_name_kana = ""
      @customer.first_name_kana = ""
      @customer.email = ""
      @customer.postal_code = "123456789"
      @customer.address = ""
      @customer.phone = ""
      @customer.password = ""
      @customer.save
    end
    it '全て入力してあるので保存される' do
      expect(@customer).to be_invalid
      expect(@customer.errors[:family_name_kanji]).to include("を入力してください")
      expect(@customer.errors[:first_name_kanji]).to include("を入力してください")
      expect(@customer.errors[:family_name_kana]).to include("を入力してください")
      expect(@customer.errors[:first_name_kana]).to include("を入力してください")
      expect(@customer.errors[:email]).to include("を入力してください")
      expect(@customer.errors[:postal_code]).to include("は7文字で入力してください")
      expect(@customer.errors[:address]).to include("を入力してください")
      expect(@customer.errors[:phone]).to include("を入力してください")
      expect(@customer.errors[:password]).to include("を入力してください")
    end
  end
end
