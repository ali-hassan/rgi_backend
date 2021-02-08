# == Schema Information
#
# Table name: special_institutions
#
#  id                :integer          not null, primary key
#  institution_type  :string
#  title             :string
#  country_sector_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  description       :text
#  name              :string
#  percentage        :integer
#  revenue_value     :integer
#  revenue_unit      :string
#  score             :integer
#  rank_1            :integer
#  rank_2            :integer
#

# frozen_string_literal :true

class SpecialInstitution < ApplicationRecord
  belongs_to :country_sector
  has_enumeration_for :institution_type, with: SpecialInstitutionTitle

end
