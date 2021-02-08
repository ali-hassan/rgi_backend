# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  average    :decimal(, )
#  min        :decimal(, )
#  max        :decimal(, )
#  position   :integer
#

class Category < ApplicationRecord
  has_many :subcategories
  has_many :country_sector_categories

  default_scope { order('categories.position ASC') }
end
