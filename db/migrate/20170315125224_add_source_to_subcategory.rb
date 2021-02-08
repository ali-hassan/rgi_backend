# frozen_string_literal: true
class AddSourceToSubcategory < ActiveRecord::Migration[5.0]
  def change
    add_column :subcategories, :source, :string
  end
end
