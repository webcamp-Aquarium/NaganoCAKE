require 'rails_helper'

RSpec.describe 'Customerモデルのテスト', type: :model do

	describe 'バリデーションのテスト' do
      it '空欄でないこと' do
        test_customer.name = ''
        is_expected.to eq false;
      end
    end  


	describe 'アソシエーションのテスト' do
    context 'Orderモデルとの関係' do
      it '1:Nとなっている' do
        expect(Customer.reflect_on_association(:orders).macro).to eq :has_many
      end
    end
  end
end