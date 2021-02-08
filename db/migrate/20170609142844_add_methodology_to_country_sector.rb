class AddMethodologyToCountrySector < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sectors, :methodology, :text
  end
end
