# == Schema Information
#
# Table name: country_sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :country_sector do
    description FFaker::Lorem.paragraph
    sequence(:score) { |n| 100 - n }
    #sequence(:rank) { |n| n }
    country
    sector
  end
end