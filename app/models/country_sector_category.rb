# frozen_string_literal: true
# == Schema Information
#
# Table name: country_sector_categories
#
#  id                :integer          not null, primary key
#  score             :decimal(, )
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  country_sector_id :integer
#  category_id       :integer
#  rank              :integer
#

class CountrySectorCategory < ApplicationRecord
  belongs_to :country_sector, required: true
  belongs_to :category, required: true
  has_many :country_sector_subcategories

  validates_uniqueness_of :category_id, scope: :country_sector_id
  validates_inclusion_of :score, in: 0..100, allow_blank: true, allow_nil: true
  validates :rank, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: true, allow_nil: true }

  default_scope { order('country_sector_categories.id ASC') }
end
