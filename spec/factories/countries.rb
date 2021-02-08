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

FactoryGirl.define do
  factory :country do
    name 'Portugal'
    iso 'PRT'
  end
end
