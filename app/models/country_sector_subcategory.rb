# frozen_string_literal: true
# == Schema Information
#
# Table name: country_sector_subcategories
#
#  id                         :integer          not null, primary key
#  score                      :decimal(, )
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  country_sector_id          :integer
#  subcategory_id             :integer
#  rank                       :integer
#  country_sector_category_id :integer
#

class CountrySectorSubcategory < ApplicationRecord
  belongs_to :subcategory, required: true
  belongs_to :country_sector, required: true
  belongs_to :country_sector_category
  has_many :country_sector_indicators

  validates_uniqueness_of :subcategory_id, scope: :country_sector_id
  validates_inclusion_of :score, in: 0..100, allow_blank: true, allow_nil: true
  validates :rank, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: true, allow_nil: true }

  default_scope { order('country_sector_subcategories.id ASC') }

end
