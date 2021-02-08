# frozen_string_literal: true
class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.text :name

      t.timestamps
    end
  end
end
