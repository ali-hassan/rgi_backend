# frozen_string_literal: true
class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :name

      t.timestamps
    end
  end
end
