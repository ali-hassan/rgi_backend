# frozen_string_literal: true
# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Group < ApplicationRecord
  has_many :country_groups
  has_many :countries, through: :country_groups
end
