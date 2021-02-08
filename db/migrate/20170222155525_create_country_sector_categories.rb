# frozen_string_literal: true
class CreateCountrySectorCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :country_sector_categories do |t|
      t.decimal :score

      t.timestamps
    end
  end
end
