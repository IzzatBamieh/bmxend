require 'rails_helper'

describe V1::PoliceReportsController, type: :controller do
  let(:bike) { create(:bike) }
  let(:user) { create(:user) }
  let(:status) { 'stolen' }
  let(:time_discovered_stolen ) { Faker::Date.between(1.days.ago, Date.today) }
  let(:police_report_params) { {user_id: user.id, bike_id: bike.id, time_discovered_stolen: time_discovered_stolen, status: status } }
  
  before(:each) do
    response = post :create, { police_report: police_report_params }, format: :json
    @police_report_response = JSON.parse(response.body, symbolize_names: true)
  end

  describe 'GET #show' do

    before(:each) do
      get :show, id: @police_report_response[:id], format: :json
    end

    it 'returns police_report information' do
      expect(@police_report_response[:bike_id]).to eql bike.id
      expect(response.status).to eq(200) 
    end
  end

  describe 'POST #create' do

    context 'when is successfully created' do
      it 'renders the json representation for the police_report record just created' do
        expect(@police_report_response[:user_id]).to eql user.id
        expect(response.status).to eq(201)
      end
    end
  end

  describe 'PUT/PATCH #update' do
  let(:status) { 'found' }

    context 'when is successfully updated' do
      before(:each) do
        @status = 'stolen'
        patch :update, { id: @police_report_response[:id],
                         police_report: { status: status} }, format: :json
      end

      it 'renders the json representation for the updated police_report' do
        police_report_response = JSON.parse(response.body, symbolize_names: true)
        expect(police_report_response[:status]).to eql status
      end

      it { expect(response.status).to eq(200) }
    end
  end
end
