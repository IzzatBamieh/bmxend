require 'rails_helper'

describe V1::BikesController, type: :controller do

  describe 'GET #show' do
    let(:bike) { create(:bike) }

    before(:each) do
      get :show, id: bike.id, format: :json
    end

    it 'returns bike information' do
      bike_response = JSON.parse(response.body, symbolize_names: true)
      expect(bike_response[:model]).to eql bike.model
      expect(response.status).to eq(200) 
    end
  end

  describe 'POST #create' do

    context 'when is successfully created' do
      before(:each) do
        @bike_attributes = attributes_for(:bike)
        post :create, { bike: @bike_attributes }, format: :json
      end

      it 'renders the json representation for the bike record just created' do
        bike_response = JSON.parse(response.body, symbolize_names: true)
        expect(bike_response[:model]).to eql @bike_attributes[:model]
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'PUT/PATCH #update' do
    let(:bike) { create(:bike) }

    context 'when is successfully updated' do
      before(:each) do
        @model = Faker::StarWars.droid
        patch :update, { id: bike.id,
                         bike: { model: @model} }, format: :json
      end

      it 'renders the json representation for the updated bike' do
        bike_response = JSON.parse(response.body, symbolize_names: true)
        expect(bike_response[:model]).to eql @model
      end

      it { expect(response.status).to eq(200) }
    end
  end
end
