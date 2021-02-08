require 'spec_helper'

describe Api::V1::CountriesController, type: :controller do
  describe 'GET #show' do
    before(:each) do
      @country = FactoryGirl.create :country
      get :show, params: { id: @country.iso }
    end

    it 'returns the information about a country on a hash' do
      country_response = json_response
      expect(country_response[:name]).to eql @country.name
    end

    it 'has the list of sectors' do
      country_response = json_response
      expect(country_response[:sectors]).to eql []
    end

    it { should respond_with 200 }
  end
end