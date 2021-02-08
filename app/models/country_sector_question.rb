# frozen_string_literal: true
# == Schema Information
#
# Table name: country_sector_questions
#
#  id                          :integer          not null, primary key
#  score                       :decimal(, )
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  country_sector_id           :integer
#  question_id                 :integer
#  rank                        :integer
#  status                      :string
#  researcher_justification    :text
#  researcher_score            :string
#  reviewer_justification      :text
#  reviewer_score              :string
#  final_score_justification   :text
#  final_score                 :string
#  country_sector_indicator_id :integer
#

class CountrySectorQuestion < ApplicationRecord
  belongs_to :country_sector, required: true
  belongs_to :question, required: true
  belongs_to :country_sector_indicator
  has_many :country_sector_answers

  validates_uniqueness_of :question_id, scope: :country_sector_id
  validates_inclusion_of :score, in: 0..100, allow_blank: true, allow_nil: true
  validates :rank, numericality: { only_integer: true, greater_than_or_equal_to: 0, allow_blank: true, allow_nil: true}

  default_scope { order('country_sector_questions.id ASC') }
end
