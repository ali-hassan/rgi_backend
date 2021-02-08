# frozen_string_literal: true
class CreateCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso
      t.decimal :score

      t.timestamps
    end
  end
end
