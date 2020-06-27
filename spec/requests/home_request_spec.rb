require 'rails_helper'
RSpec.describe "Home", type: :request do
    describe 'TOPページ' do
        context "TOPページが正しく表示される" do
            before do
                get root_path
            end
            it 'リクエストは200 OKとなること' do
                expect(response.status).to eq 200
            end
            it '今週のおすすめと表示される' do
                expect(response.body).to include("今週のおすすめ")
            end
        end
    end
end
