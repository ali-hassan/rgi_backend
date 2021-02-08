# == Schema Information
#
# Table name: countries
#
#  id          :integer          not null, primary key
#  name        :string
#  iso         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_id    :integer
#  description :string
#

require 'spec_helper'

describe Country, type: :model do
  before { @country = FactoryGirl.build(:country) }

  subject { @country }

  it { should validate_presence_of(:iso) }
  it { should validate_presence_of(:name) }

  it { should validate_uniqueness_of(:iso) }
  it { should validate_uniqueness_of(:name) }

  it { should be_valid }

  describe 'when there\'s no ISO' do
    before { @country.iso = '' }
    it { should_not be_valid }
  end

  describe 'when there\'s no name' do
    before { @country.name = '' }
    it { should_not be_valid }
  end
end
