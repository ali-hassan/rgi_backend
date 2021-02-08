# == Schema Information
#
# Table name: direction_scores
#
#  id                 :integer          not null, primary key
#  direction_graph_id :integer
#  issue              :string
#  score              :integer
#  direction          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class DirectionScore < ApplicationRecord
  belongs_to :direction_graph
end
