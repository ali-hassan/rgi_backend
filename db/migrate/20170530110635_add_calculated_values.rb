class AddCalculatedValues < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :average, :decimal
    add_column :categories, :min, :decimal
    add_column :categories, :max, :decimal
    add_column :subcategories, :average, :decimal
    add_column :subcategories, :min, :decimal
    add_column :subcategories, :max, :decimal

    create_table :composites do |t|
      t.decimal :average
      t.decimal :min
      t.decimal :max

      t.timestamps
    end
  end
end
