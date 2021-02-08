# == Schema Information
#
# Table name: direction_graphs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DirectionGraph < ApplicationRecord
  has_one :country_sector
  has_many :direction_scores
  accepts_nested_attributes_for :direction_scores, :allow_destroy => true
end
