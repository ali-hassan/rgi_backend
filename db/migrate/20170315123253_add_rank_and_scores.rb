# frozen_string_literal: true
class AddRankAndScores < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sectors, :rank, :integer
    add_column :country_sector_categories, :rank, :integer
    add_column :country_sector_subcategories, :rank, :integer
    add_column :country_sector_questions, :rank, :integer
  end
end
