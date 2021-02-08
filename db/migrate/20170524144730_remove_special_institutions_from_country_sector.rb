class RemoveSpecialInstitutionsFromCountrySector < ActiveRecord::Migration[5.0]
  def change
    remove_column :country_sectors, :special_institutions_description, :text
    remove_column :country_sectors, :special_institutions_title, :string
    remove_column :country_sectors, :special_institutions, :boolean
  end
end
