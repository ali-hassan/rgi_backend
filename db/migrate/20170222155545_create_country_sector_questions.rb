# frozen_string_literal: true
class CreateCountrySectorQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :country_sector_questions do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
