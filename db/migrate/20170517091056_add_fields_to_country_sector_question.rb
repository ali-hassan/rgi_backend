class AddFieldsToCountrySectorQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :country_sector_questions, :status, :string
    add_column :country_sector_questions, :researcher_justification, :text
    add_column :country_sector_questions, :researcher_score, :string
    add_column :country_sector_questions, :reviewer_justification, :text
    add_column :country_sector_questions, :reviewer_score, :string
    add_column :country_sector_questions, :final_score_justification, :text
    add_column :country_sector_questions, :final_score, :string
  end
end
