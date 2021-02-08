# frozen_string_literal: true
class CreateCountrySectorAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :country_sector_answers do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
