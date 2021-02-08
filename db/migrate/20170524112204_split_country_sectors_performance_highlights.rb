class SplitCountrySectorsPerformanceHighlights < ActiveRecord::Migration[5.0]
  def change
    rename_column :country_sectors, :performance_highlights, :performance_highlights_top
    add_column :country_sectors, :performance_highlights_bottom, :text
  end
end
