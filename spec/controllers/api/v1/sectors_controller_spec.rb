require 'spec_helper'

describe Api::V1::SectorsController, type: :controller do

  describe 'GET #show' do
    before(:each) do
      @sector = FactoryGirl.create :sector
      get :show, params: { id: @sector.id }
    end

    it 'returns the information about the sector' do
      sector_response = json_response
      expect(sector_response[:name]).to eql(@sector.name)
    end

    it { should respond_with 200 }
  end

  describe 'GET #show(name)' do
    before(:each) do
      @sector = FactoryGirl.create :sector
      get :show, params: { id: @sector.name }
    end

    it 'returns the information about the sector by name' do
      sector_response = json_response
      expect(sector_response[:name]).to eql(@sector.name)
    end

    it { should respond_with 200 }
  end

  describe 'GET #index' do
    before(:each) do
      2.times { FactoryGirl.create :sector }
      get :index
    end

    it 'returns 2 sectors' do
      sectors_response = json_response
      expect(sectors_response.size).to eql(2)
    end

    it { should respond_with 200 }
  end
end