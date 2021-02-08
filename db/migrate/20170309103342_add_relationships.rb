# frozen_string_literal: true
class AddRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :subcategories, :category_id, :integer
    add_index  :subcategories, :category_id

    add_column :questions, :subcategory_id, :integer
    add_index  :questions, :subcategory_id

    add_column :answers, :question_id, :integer
    add_index  :answers, :question_id

    add_column :countries, :group_id, :integer
    add_index  :countries, :group_id

    add_column :country_sectors, :country_id, :integer
    add_index  :country_sectors, :country_id
    add_column :country_sectors, :sector_id, :integer
    add_index  :country_sectors, :sector_id

    add_column :country_sector_categories, :country_sector_id, :integer
    add_index  :country_sector_categories, :country_sector_id
    add_column :country_sector_categories, :category_id, :integer
    add_index  :country_sector_categories, :category_id

    add_column :country_sector_subcategories, :country_sector_id, :integer
    add_index  :country_sector_subcategories, :country_sector_id
    add_column :country_sector_subcategories, :subcategory_id, :integer
    add_index  :country_sector_subcategories, :subcategory_id

    add_column :country_sector_questions, :country_sector_id, :integer
    add_index  :country_sector_questions, :country_sector_id
    add_column :country_sector_questions, :question_id, :integer
    add_index  :country_sector_questions, :question_id

    add_column :country_sector_answers, :country_sector_id, :integer
    add_index  :country_sector_answers, :country_sector_id
    add_column :country_sector_answers, :answer_id, :integer
    add_index  :country_sector_answers, :answer_id
  end
end
