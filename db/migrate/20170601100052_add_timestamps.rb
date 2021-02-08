class AddTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column :countries_groups, :created_at, :datetime
    add_column :countries_groups, :updated_at, :datetime

    add_column :country_sector_indicators, :created_at, :datetime
    add_column :country_sector_indicators, :updated_at, :datetime

    add_column :indicators, :created_at, :datetime
    add_column :indicators, :updated_at, :datetime

  end
end
