# == Schema Information
#
# Table name: countries_groups
#
#  group_id   :integer          not null
#  country_id :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class CountryGroup < ApplicationRecord
  self.table_name = 'countries_groups'
  belongs_to :country
  belongs_to :group
end
