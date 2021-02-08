# frozen_string_literal: true
class CreateCountrySectors < ActiveRecord::Migration[5.0]
  def change
    create_table :country_sectors do |t|
      t.text :description
      t.decimal :score

      t.timestamps
    end
  end
end
