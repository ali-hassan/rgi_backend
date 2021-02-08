# frozen_string_literal: true
# == Schema Information
#
# Table name: answers
#
#  id           :integer          not null, primary key
#  name         :string
#  answer_type  :string
#  value_number :decimal(, )
#  value_string :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  question_id  :integer
#

class Answer < ApplicationRecord
  belongs_to :question, required: true
end
