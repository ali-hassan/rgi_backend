# == Schema Information
#
# Table name: country_sector_indicators
#
#  id                            :integer          not null, primary key
#  score                         :decimal(, )
#  rank                          :integer
#  country_sector_id             :integer
#  indicator_id                  :integer
#  country_sector_subcategory_id :integer
#  created_at                    :datetime
#  updated_at                    :datetime
#

class CountrySectorIndicator < ApplicationRecord
  belongs_to :country_sector, required: true
  belongs_to :indicator, required: true
  belongs_to :country_sector_subcategory
  has_many :country_sector_questions

  validates_uniqueness_of :indicator_id, scope: :country_sector_id
  validates_inclusion_of :score, in: 0..100, allow_blank: true, allow_nil: true
  validates :rank, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: true, allow_nil: true }

  default_scope { order('country_sector_indicators.id ASC') }


end
