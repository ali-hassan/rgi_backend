class AddFootnoteToCountrySector < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sectors, :footnote, :text
  end
end
