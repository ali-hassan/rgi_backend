# frozen_string_literal: true
# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  name         :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#  number       :integer
#  indicator_id :integer
#  position     :integer
#

class Question < ApplicationRecord
  belongs_to :indicator, required: true
  has_many :answers

  default_scope { order('questions.number ASC') }
end
