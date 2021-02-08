require 'spec_helper'

describe Api::V1::CountrySectorsController, type: :controller do

  describe 'GET #show' do
    before(:each) do
      @country_sector = FactoryGirl.create :country_sector
      get :show, params: { id: @country_sector.id }
    end

    it 'returns the information about the country sector' do
      country_sector_response = json_response
      expect(country_sector_response[:description]).to eql(@country_sector.description)
    end

    it { should respond_with 200 }
  end
end
