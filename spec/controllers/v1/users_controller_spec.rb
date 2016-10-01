require 'rails_helper'

describe V1::UsersController, type: :controller do

  describe 'GET #show' do
    let(:user) { create(:user) }

    before(:each) do
      get :show, id: user.id, format: :json
    end

    it 'returns user information' do
      user_response = JSON.parse(response.body, symbolize_names: true)
      expect(user_response[:email]).to eql user.email
      expect(response.status).to eq(200) 
    end
  end

  describe 'POST #create' do

    context 'when is successfully created' do
      before(:each) do
        @user_attributes = attributes_for(:user)
        post :create, { user: @user_attributes }, format: :json
      end

      it 'renders the json representation for the user record just created' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @user_attributes[:email]
        expect(response.status).to eq(201)
      end
    end

    context 'when is not created' do
      before(:each) do
        @invalid_user_attributes = { password: '12345678',
                                     password_confirmation: '12345678' }
        post :create, { user: @invalid_user_attributes }, format: :json
      end

      it 'renders an errors json' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it 'renders the json errors on why the user could not be created' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { expect(response.status).to eq(422) }
    end
  end
  describe 'PUT/PATCH #update' do
    let(:user) { create(:user) }

    context 'when is successfully updated' do
      before(:each) do
        @email = Faker::Internet.email
        patch :update, { id: user.id,
                         user: { email: @email} }, format: :json
      end

      it 'renders the json representation for the updated user' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:email]).to eql @email
      end

      it { expect(response.status).to eq(200) }
    end

    context 'when is not updated' do
      before(:each) do
        patch :update, { id: user.id,
                         user: { email: 'bademail.com' } }, format: :json
      end

      it 'renders an errors json' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response).to have_key(:errors)
      end

      it 'renders the json errors on whye the user could not be updated' do
        user_response = JSON.parse(response.body, symbolize_names: true)
        expect(user_response[:errors][:email]).to include 'is invalid'
      end

      it { expect(response.status).to eq(422) }
    end
  end
end
