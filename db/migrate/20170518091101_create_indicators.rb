class CreateIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :indicators do |t|
      t.string :name
      t.text :description
      t.references :subcategory, foreign_key: true
    end
  end
end
