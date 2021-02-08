# == Schema Information
#
# Table name: bubble_graphs
#
#  id         :integer          not null, primary key
#  x          :integer
#  y          :decimal(, )
#  size       :decimal(, )
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BubbleGraph < ApplicationRecord
  has_one :country_sector
end
