require 'rails_helper'

RSpec.describe "CustomerAuthentications",type: :request do
  let(:customer){ create(:customer) }
  let(:customer_params){ attributes_for(:customer) }
  let(:invalid_customer_params){ attributes_for(:customer, family_name_kanji: "")}

  describe 'POST #create' do
    before do
      ActionMailer::Base.deliveries.clear
    end
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post customer_registration_path, params: { customer: customer_params}
        expect(response.status).to eq 302
      end

      it 'createが成功すること' do
        expect do
          post customer_registration_path, params: { customer: customer_params }
        end.to change(Customer, :count).by 1
      end

      it 'リダイレクトされること' do
        post customer_registration_path, params: { customer: customer_params }
        expect(response).to redirect_to root_path
      end
    end

    context 'パラメータが不正な場合' do
      it 'リクエストが失敗すること' do
        post customer_registration_path, params: { customer: invalid_customer_params}
        expect(response.status).to eq 200
      end

      it 'createが失敗すること' do
        expect do
          post customer_registration_path, params: { customer: invalid_customer_params}
        end.to_not change(Customer, :count)
      end

      it 'エラーが表示されること' do
        post customer_registration_path, params: { customer: invalid_customer_params}
        expect(response.body).to include 'エラーが発生したため customer は保存されませんでした。'
      end
    end
  end

  describe 'GET #edit' do
    subject { get edit_customer_registration_path }
    context 'ログインしている場合' do
      before do
        sign_in customer
      end
      it 'リクエストが成功すること' do
        is_expected.to eq 200
      end
    end
    context 'ゲストの場合' do
      it 'リダイレクトされること' do
        is_expected.to redirect_to new_customer_session_path
      end
    end
  end

  describe 'GET #show' do
    context 'ログイン中のユーザーのページの場合' do
      before do
        sign_in customer
      end
      it 'リクエストが成功すること' do
        get customer_path(customer)
        is_expected.to eq 200
      end
    end
    context 'ユーザーが存在しない場合' do
      it 'エラーが発生すること' do
        customer_id = customer.id
        customer.destroy
        expect{ get "/customers/#{customer_id}"}.to raise_error ActiveRecord::RecordNotFound
      end
    end
  end
end