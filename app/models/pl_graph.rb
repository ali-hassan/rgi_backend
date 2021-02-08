# == Schema Information
#
# Table name: pl_graphs
#
#  id         :integer          not null, primary key
#  practice   :integer
#  law        :integer
#  gap        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlGraph < ApplicationRecord
  validates_inclusion_of :law, in: 0..100, allow_blank: true, allow_nil: true
  validates_inclusion_of :practice, in: 0..100, allow_blank: true, allow_nil: true
  has_one :country_sector
end
