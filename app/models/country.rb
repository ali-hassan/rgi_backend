# frozen_string_literal: true
# == Schema Information
#
# Table name: countries
#
#  id          :integer          not null, primary key
#  name        :string
#  iso         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  group_id    :integer
#  description :string
#

class Country < ApplicationRecord
  has_many :country_groups
  has_many :groups, through: :country_groups
  has_many :country_sectors
  has_many :sectors, through: :country_sectors

  validates_presence_of :name, :iso
  validates_uniqueness_of :name, :iso
end
