# frozen_string_literal: true
class AddDescriptionToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :description, :text
  end
end
