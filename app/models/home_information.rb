# == Schema Information
#
# Table name: home_informations
#
#  id         :integer          not null, primary key
#  section    :string
#  title      :string
#  subtitle   :string
#  text       :text
#  link_text  :string
#  link_url   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HomeInformation < ApplicationRecord
	enum sections: ['Intro', 'Country Profiles', 'Country Spotlight', 'Download']

	validates :section, inclusion: {in: sections}
	validates_uniqueness_of :section
end
