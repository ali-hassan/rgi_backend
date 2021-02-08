# frozen_string_literal: true
# == Schema Information
#
# Table name: subcategories
#
#  id          :integer          not null, primary key
#  name        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  source      :string
#  average     :decimal(, )
#  min         :decimal(, )
#  max         :decimal(, )
#  position    :integer
#

class Subcategory < ApplicationRecord
  extend EnumerateIt

  belongs_to :category, required: true
  has_many :indicators
  has_many :country_sector_subcategories

  has_enumeration_for :source, with: SubcategoryType, skip_validation: true

  default_scope { order('subcategories.position ASC') }
end
