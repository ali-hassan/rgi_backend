# frozen_string_literal: true
class AddDescriptionToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :description, :string
  end
end
