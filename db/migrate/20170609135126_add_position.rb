class AddPosition < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :position, :int
    add_column :subcategories, :position, :int
    add_column :indicators, :position, :int
    add_column :questions, :position, :int
  end
end
