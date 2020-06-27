# require 'rails_helper'
# RSpec.describe "Administrator", type: :request do
#   before do
#     get new_admin_administrator_session_path
#   end
#   context 'メールアドレス・パスワードでログインする' do
#     it 'ログインに成功する' do
#       fill_in 'email',with: 'test@gmail.com'
#       fill_in 'password',with: 'aaaaaa'
#       click_button 'Log in'

#       expect(page).to have_content '成功しました'
#     end
#   end
# end