# frozen_string_literal: true
# == Schema Information
#
# Table name: country_sectors
#
#  id                            :integer          not null, primary key
#  description                   :text
#  score                         :decimal(, )
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  country_id                    :integer
#  sector_id                     :integer
#  rank                          :integer
#  performance_title             :string
#  performance_highlights_top    :text
#  comparison_title              :string
#  comparison_description        :text
#  graph_type                    :string
#  performance_highlights_bottom :text
#  graph_text                    :text
#  footnote                      :text
#  pl_graph_id                   :integer
#  bubble_graph_id               :integer
#  direction_graph_id            :integer
#  methodology                   :text
#

class CountrySector < ApplicationRecord
  extend EnumerateIt
  belongs_to :country, required: true
  belongs_to :sector, required: true
  has_many :country_sector_categories
  has_many :categories , through: :country_sector_categories
  has_many :country_sector_subcategories
  has_many :subcategories, through: :country_sector_subcategories
  has_many :country_sector_indicators
  has_many :indicators, through: :country_sector_indicators
  has_many :country_sector_questions
  has_many :question, through: :country_sector_questions
  has_many :country_sector_answers
  has_many :answers, through: :country_sector_answers
  has_many :special_institutions

  belongs_to :pl_graph, required: false
  belongs_to :bubble_graph, required: false
  belongs_to :direction_graph, required: false

  accepts_nested_attributes_for :special_institutions, allow_destroy: true
  accepts_nested_attributes_for :bubble_graph, allow_destroy: true
  accepts_nested_attributes_for :pl_graph, allow_destroy: true
  accepts_nested_attributes_for :direction_graph, allow_destroy: true

  has_enumeration_for :graph_type, with: GraphType

  validates_uniqueness_of :sector_id, scope: :country_id
  validates_inclusion_of :score, in: 0..100, allow_blank: true, allow_nil: true
  validates :rank, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true, allow_nil: true



  before_save :clean_comparisons

  default_scope { order('country_sectors.id ASC') }

  private

  def clean_comparisons
    if country.sectors.count < 2
      comparison_title = ''
      comparison_description= ''
    end
  end
end
