class ChangeQuestionParents < ActiveRecord::Migration[5.0]
  def change
    remove_index  :questions, :subcategory_id
    remove_column :questions, :subcategory_id, :integer


    add_column :questions, :indicator_id, :integer
    add_index  :questions, :indicator_id
  end
end
