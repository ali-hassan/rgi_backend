# frozen_string_literal: true
# == Schema Information
#
# Table name: sectors
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sector < ApplicationRecord
  has_many :country_sectors
  has_many :countries, through: :country_sectors
end
