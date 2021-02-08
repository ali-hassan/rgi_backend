# == Schema Information
#
# Table name: indicators
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  subcategory_id :integer
#  average        :decimal(, )
#  min            :decimal(, )
#  max            :decimal(, )
#  created_at     :datetime
#  updated_at     :datetime
#  position       :integer
#

class Indicator < ApplicationRecord
  belongs_to :subcategory, required: true
  has_many :questions
  has_many :country_sector_indicators

  validates_presence_of :name

  default_scope { order('indicators.position ASC') }
end
