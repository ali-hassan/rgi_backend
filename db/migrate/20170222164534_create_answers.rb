# frozen_string_literal: true
class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.string :answer_type
      t.decimal :value_number
      t.string :value_string

      t.timestamps
    end
  end
end
