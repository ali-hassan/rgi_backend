class AddCountrySectorHierarchy < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sector_subcategories, :country_sector_category_id, :integer
    add_column :country_sector_indicators, :country_sector_subcategory_id, :integer
    add_column :country_sector_questions, :country_sector_indicator_id, :integer
  end
end
