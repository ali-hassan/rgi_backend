class AddGraphTextToCountrySectors < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sectors, :graph_text, :text
  end
end
