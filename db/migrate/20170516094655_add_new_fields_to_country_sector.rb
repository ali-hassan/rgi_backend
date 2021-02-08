class AddNewFieldsToCountrySector < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sectors, :performance_title, :string
    add_column :country_sectors, :performance_highlights, :text
    add_column :country_sectors, :comparison_title, :string
    add_column :country_sectors, :comparison_description, :text
    add_column :country_sectors, :graph_type, :string
    add_column :country_sectors, :special_institutions, :boolean
    add_column :country_sectors, :special_institutions_title, :string
    add_column :country_sectors, :special_institutions_description, :text
  end
end
